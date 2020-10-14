## <a name="install.upgrade"></a>Upgrade

If you are not installing for the first time, here are the instructions for upgrading your installation:

1. [Download the files](#install.upgrade.download)
2. [Upgrade the J2EE application](#install.upgrade.installJ2EE)
3. [Upgrade the database objects](#install.upgrade.installDB)
4. [Upgrade the APEX test application](#install.upgrade.apex)

### <a name="install.upgrade.download"></a>1. Download the files

You can download the files from [here](https://github.com/daust/JasperReportsIntegration/releases) and unzip them.

### <a name="install.upgrade.installJ2EE"></a>2. Upgrade the J2EE application

#### 2.1. Make a backup

First, make a backup of all the configuration and report files in your existing environment.

#### 2.2. A regular installation of the J2EE application

The next step is to install the J2EE application regularly as described in section [2. Installation in the J2EE server](installation-full.md#install.installation.installJ2EE).

#### 2.3. Copy your report files into the proper location

The report files from your backup need to be copied into the target reports directory. If you already have a shared configuration directory, then the J2EE application will already find the relevant files.

With regards to the ``conf/application.properties`` file it is best to use the new configuration file and manually transfer the old settings into the new configuration file.

In order to use newer features, you might need to add new configuration parameters to your ``application.properties`` file. Please check the documentation for new parameters. 


#### 2.2. Restart the J2EE server

Restart the J2EE server, so that it will pick up the new configuration. It should be enough to restart the J2EE application only unless you have changed the environment of the J2EE server itself.

### 3. Upgrade the database objects

The database objects required for the integration have to be installed into each application schema that you want to use with the integration. Thus we have to upgrade all schemas that use the integration kit.
The installation instructions will refer to the application schema (in which you install the software) as [application schema]. The password for the application schema will be referred to as [application schema password].

Thus when I use an instruction like sqlplus ``[application schema]/[application schema password]@[database]`` please replace that with the actual values of your local installation. For example, if you want to install the integration kit into the schema ``HR`` with the password ``hr1`` into your local XE instance (having a TNS entry named ``xe``) then this instruction translates to:
```
sqlplus hr/hr1@xe
```

For a typical upgrade of an existing schema you don't have to do the installation as SYS. The user already has the proper rights and privileges. All you need to do is to upgrade the schema objects.

#### 3.1 Database installation (Application Schema)

1. Open a command shell:
  * e.g. on Windows: Start > Execute : cmd
  * Go to the subdirectory sql (of where you extracted the file):
```
cd sql
```

2. Connect as the application schema to the local instance (using sqlplus)
```
sqlplus [application schema]/[application schema password]@[database]
```

3. Run the upgrade script
```
@patch.sql
```

4. Upgrade the APEX test application

The test application will allow for basic testing of the integration with all relevant parts. Install the application file ``apex\[apex version]\f201_JasperReportsIntegration-Test_[version].sql`` into your workspace. 
You can just replace the existing one.

Please always pick the highest APEX version, e.g. when running APEX 19.1 and above (19.2, 20.1, ...), please install ``apex\APEX 19.1\f201_JasperReportsIntegration-Test_2.6.1.sql``.
