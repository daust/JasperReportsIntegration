# <a name="integration"></a>Integration and Usage

## Call Interface

The package ``XLIB_JASPERREPORTS`` is the interface which accepts the parameters, generates the url and calls the integration on the locally installed J2EE server.

e.g.:
```
declare
    l_additional_parameters varchar2(32767);
begin
    -- setting the report url explicitly is optional since v2.6.1, 
    -- the defaults from the table xlib_jasperreports_conf will be picked up
    -- xlib_jasperreports.set_report_url('http://localhost:8080/JasperReportsIntegration/report');

    /*
        When you are using HTML as the output format, then the images for the report are also 
        generated in the J2EE server. They are referenced in the generated html document. 
        Typically, all images are "tunneled" through the database, but this will slow it down 
        when you have many images in your html report. 

        When both ORDS and JRI are running on the same J2EE server, you then can call 
            xlib_jasperreports.use_images_no_tunnel();
        in order to access the generated images from the report directly. This is a lot faster than 
        tunneling each image. 

        Using use_images_no_tunnel will allow you to call the images directly from the J2EE application server 
        and not through the database. Anyhow, this is secured through the java session (cookie JSESSIONID) which 
        was established by calling the J2ee server through the database via UTL_HTTP. 
    */ 
    -- xlib_jasperreports.use_images_no_tunnel();

    -- construct addional parameter list
    l_additional_parameters := 'parameter1=' || apex_util.url_encode(:p1_filter_object_name);
    l_additional_parameters := l_additional_parameters 
                               || '&parameter2=' || apex_util.url_encode(:p1_filter_object_type);

    -- call the J2EE application and display the returned file
    xlib_jasperreports.show_report (p_rep_name => :p5_rep_name,
          p_rep_format          => :p5_rep_format,
          p_data_source         => :p5_data_source,
          p_out_filename        => :p5_out_filename,
          p_rep_locale          => :p5_rep_locale,
          p_rep_encoding        => :p5_rep_encoding,
          p_additional_params   => l_additional_parameters,
          p_print_is_enabled    => case when :p5_print_is_enabled='1' then true else false end,
          p_print_printer_name  => :p5_print_printer_name,
          p_print_media         => :p5_print_media,
          p_print_copies        => :p5_print_copies,
          p_print_duplex        => case when :p5_print_duplex='1' then true else false end,
          p_print_collate       => case when :p5_print_collate='1' then true else false end,
          p_save_is_enabled     => case when :p5_save_is_enabled='1' then true else false end,
          p_save_filename       => :p5_save_filename,
          p_rep_time_zone       => :p5_rep_time_zone
          );

    -- stop rendering of the current APEX page (APEX version up until version 4.0)
    -- apex_application.g_unrecoverable_error := true;
    -- stop rendering of the current APEX page (APEX version 4.1 and higher)
    apex_application.stop_apex_engine;
exception
  when apex_application.e_stop_apex_engine then
    null; -- ok, stop engine raises exception, we can ignore that
      
end;
```

Here is a description of the input parameters:

|parameter|description|default value|required?|
|:--      |:--        |:--          |   :--:  |
|p_rep_name|name of the report (needs a name.jasper file deployed on the server)|test|*|
|p_rep_format|format of the generated format: see constants in package XLIB_JASPERREPORTS, e.g. pdf, html, html2, rtf, xls, jxl, csv, xlsx, pptx or docx|pdf|*|
|p_data_source|data source name, needs to be configured application.poperties file|default|*||
|p_out_filename|a filename can be specified for the download for the "save as" dialog||
|p_rep_locale|Locale string (e.g. de_DE or en_US), composed of the ISO language code and ISO country code|de_DE||
|p_rep_encoding|the "charset" parameter for the content_type, a list of valid entries can be found here. E.g.: ISO-8859-15, UTF-8, Windows-1252|UTF-8||
|p_additional_parameters|all parameters are passed directly to the report (excluding the the internal ones prefixed with "_", e.g.: p1=1&p2=2)||
|p_print_is_enabled|shall the report be sent to the printer directly?|false||
|p_print_printer_name|name of the printer (only when p_print_is_enabled=true)||
|p_print_media|media used, either the paper size or the tray (only when p_print_is_enabled=true)||
|p_print_copies|number of copies to be printed (only when p_print_is_enabled=true)||
|p_print_duplex|duplex printing? (only when p_print_is_enabled=true)||
|p_print_collate|sorting the print output? (only when p_print_is_enabled=true)||
|p_save_is_enabled|shall the generated file be saved on the application server, too?||
|p_save_filename|fully specified path to the filename where the output should be saved on the server (only when p_save_is_enabled=true)||
|p_rep_time_zone|"time zone" parameter for the execution of the report, a list of valid entries can be found here: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones e.g.: Europe/Berlin, UCT, US/Central, US/Pacific, Etc/Greenwich, Europe/London||

## Call Interface (picking up defaults from the table ``XLIB_JASPERREPORTS_CONF``)

Previously, you needed to set the following parameters manually before calling ``xlib_jasperreports.show_report`` or ``xlib_jasperreports.get_report``: 

* xlib_jasperreports.set_report_url
* utl_http.set_wallet
* utl_http.set_transfer_timeout

This is now done for you using the defaults in the table ``XLIB_JASPERREPORTS_CONF``. 

Setting those parameters explicitly will still work, they are only set when those values HAVE NOT BEEN SET. 
Unfortunately, this is not the case for utl_http.set_wallet because we cannot determine the current wallet path. 
Thus, when the report url is using https, set_wallet will be called automatically based on the values in ``XLIB_JASPERREPORTS_CONF`` regardless of previous calls to utl_http.set_wallet ... thus overwriting it. 

## Designing reports

First of all, we need to design the report. The preferred method is to use the newer Jaspersoft Studio (https://community.jaspersoft.com/project/jaspersoft-studio/releases) to create the report definition file, but reports created with the older iReport designer will also work. We use a JDBC connection to connect to the target Oracle Schema and design the report. 

## Deployment of reports

The report files will have to be stored on the application server. Copy the compiled version (``report.jasper``) of your report definition file (``test.jrxml``) into the directory ``OC_JASPER_CONFIG_HOME/reports/``.

**Version 2.6.1 now supports ``.jrxml`` OR ``.jasper`` files, either one is fine. It will automatically detect whether the ``.jasper`` exists and has a timestamp later than the ``.jrxml`` (if it exists) and recompile it on the fly.** 

You can also create subdirectories to organize your reports. For example if you have different reports in your application application1 for sales and for controlling:

1. ``reports/test.jasper``
2. ``reports/application1/sales/sales-report.jasper``
3. ``reports/application1/controlling/controlling-report.jasper``

You would use as a p_rep_name the following values:
1. ``p_rep_name => 'test'``
2. ``p_rep_name => 'application1/sales/sales-report'``
3. ``p_rep_name => 'application1/controlling/controlling-report'``

## Input parameter for the reports

You can specify input parameters for the reports and use them as a filter. They have to be defined as ``STRING``, they cannot be number or any other data type. This is due to how the integration calls the reports. 

For example consider defining a parameter called ``p_bill_id``. You would use it like this in your SQL query:
```
select *
  from opal_pjm_bills_rl_v
 where bill_id = to_number( $P{p_bill_id} )
```

## Configuration of export properties 

You can control the behaviour when exporting the report into the different report formats like pdf, html, rtf, xls, jxl, csv, xlsx, pptx or docx. 

You can find the configuration reference at:

http://jasperforge.org/uploads/publish/jasperreportswebsite/trunk/config.reference.html

There are two ways how to set export properties.

### 1. Global export configuration properties

JasperReports will load the ``jasperreports.properties`` from classpath.

In case you are using Tomcat, the properties file can be placed in this
directory (it will be initially installed here anyway):

```
$TOMCAT_HOME/webapps/jri/WEB-INF/classes/jasperreports.properties
```
       
Example ``jasperreports.properties``:

```
--------------------------------------------------------------------------------
#
# You can find all possible configuration parameters here:
# http://jasperforge.org/uploads/publish/jasperreportswebsite/trunk/config.reference.html
#

# general export properties
#net.sf.jasperreports.export.ignore.page.margins=true

# docx export properties
net.sf.jasperreports.export.docx.frames.as.nested.tables=true

# xls export properties (also for xlsx)
net.sf.jasperreports.export.xls.white.page.background=true
net.sf.jasperreports.export.xls.one.page.per.sheet=true
#net.sf.jasperreports.export.xls.remove.empty.space.between.columns=true
#net.sf.jasperreports.export.xls.remove.empty.space.between.rows=true

# csv export properties
net.sf.jasperreports.csv.field.delimiter=\t

# html export properties
net.sf.jasperreports.export.html.output.images.to.dir=true
net.sf.jasperreports.export.html.images.dir=/reports/tmp
net.sf.jasperreports.export.html.output.images.uri=/JasperReportsIntegration/reports/tmp/
```

### 2. Individual export configuration properties per report

Properties can also be set in the jrxml file for each individual report. Therefore it is possible to use
different sets of properties for one JasperReportsIntegretion instance, because
all necessary properties are set in the compiled jasper file.

Example
```
--------------------------------------------------------------------------------
<jasperReport xmlns="http://jasperreports.sourceforge.net/jasperreports"
    ...
    isSummaryNewPage="true" isIgnorePagination="true"
    ...
   
    <property name="net.sf.jasperreports.export.xls.white.page.background"
        value="false"/>
</jasperReport>
--------------------------------------------------------------------------------
```

You can find the configuration settings in iReport in the properties view of the report (root node)

Individual report settings will always override global settings.

## PDF Encryption and Password Protection

You can encrypt and password-protect generated PDF files. 

See [here](http://jasperreports.sourceforge.net/sample.reference/pdfencrypt/index.html) for details. 

When you configure the following properties, you can use it in your report: 
```
net.sf.jasperreports.export.pdf.encrypted=true
net.sf.jasperreports.export.pdf.128.bit.key=true
net.sf.jasperreports.export.pdf.user.password=123456
net.sf.jasperreports.export.pdf.owner.password=123456
```
This can be done through JasperSoftStudio by first selecting the report and then choosing "Advanced > Edit Properties": 
![image](https://user-images.githubusercontent.com/4840057/171997936-c5625a88-17d5-473a-84dd-392f9c3414ed.png)

Or you can add these properties directly into the .jrxml file: 
```
	<property name="net.sf.jasperreports.export.pdf.encrypted" value="true"/>
	<property name="net.sf.jasperreports.export.pdf.128.bit.key" value="true"/>
	<property name="net.sf.jasperreports.export.pdf.owner.password" value="123456"/>
	<property name="net.sf.jasperreports.export.pdf.user.password" value="123456"/>
```

There is a sample included, the report can be found here: ``reports/demo/encrypt-pdf.jrxml``.
