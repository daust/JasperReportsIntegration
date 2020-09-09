package de.oc.print;

import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.util.ArrayList;
import java.util.Locale;

import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.attribute.Attribute;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.standard.Copies;
import javax.print.attribute.standard.JobName;
import javax.print.attribute.standard.Media;
import javax.print.attribute.standard.SheetCollate;
import javax.print.attribute.standard.Sides;

import org.apache.log4j.Logger;

import de.oc.integration.jasper.webapp.AppConfig;
import de.oc.utils.Utils;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPrintServiceExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimplePrintServiceExporterConfiguration;

public class PrinterUtilities {

	private ArrayList<PrintService> printers;
	private static Logger logger = Logger.getLogger(PrinterUtilities.class);

	/**
	 * constructor
	 */
	public PrinterUtilities() {
		printers = new ArrayList<PrintService>();

		/* Create an array of PrintServices */
		PrintService[] services = PrintServiceLookup.lookupPrintServices(null,
				null);

		for (int i = 0; i < services.length; i++) {
			// Printer printer=new Printer(services[i]);
			// printers.add(printer);
			printers.add(services[i]);
		}
	}

	/**
	 * get a list of the locally installed printers
	 * 
	 * @return list of installed printers
	 */
	public ArrayList<PrintService> getInstalledPrinters() {
		return printers;
	}

	/**
	 * Select a printService by Name (substring)
	 * 
	 * @param printerName name of the printer as seen on printerDiagnostics
	 * 
	 * @return the printService object
	 */
	public PrintService lookupPrintService(String printerName) {
		PrintService printService = null;

		// first identical search
		for (int i = 0; i < printers.size(); i++) {
			PrintService ps = (PrintService) printers.get(i);

			if (ps.getName().equals(printerName)) {
				printService = ps;
			}
		}

		// if no identical match => now substring search
		if (printService == null) {
			for (int i = 0; i < printers.size(); i++) {
				PrintService ps = (PrintService) printers.get(i);

				if (ps.getName().contains(printerName)) {
					printService = ps;
				}
			}
		}

		return printService;
	}

	/**
	 * lookup media, e.g. the printer tray
	 * 
	 * @param printService the printService
	 * @param mediaName the media name
	 * 
	 * @return the media object
	 */
	public Media lookupMedia(PrintService printService, String mediaName) {

		Media medias[] = (Media[]) printService.getSupportedAttributeValues(
				Media.class, null, null);
		Media selectedMedia = null;

		// first identical search
		for (int k = 0; k < medias.length; k++) {
			if (medias[k].toString().trim().equals(mediaName)) {
				selectedMedia = medias[k];
			}
		}
		// if no identical match => now substring search
		if (selectedMedia == null) {
			for (int k = 0; k < medias.length; k++) {
				if (medias[k].toString().trim().contains(mediaName)) {
					selectedMedia = medias[k];
				}
			}
		}

		if (selectedMedia != null) {
			logger.trace("Media selected:" + selectedMedia.getValue());
			logger.trace("Media selected:"
					+ selectedMedia.getCategory().getName());
			logger.trace("Media selected:" + selectedMedia.getName());
			logger.trace("Media selected:"
					+ selectedMedia.getClass().toString());
			logger.trace("Media selected:" + selectedMedia.toString());
		}

		return selectedMedia;
	}

	/**
	 * 
	 * @param jasperPrint jasperPrint
	 * @param printerName name of the printer
	 * @param trayName name of the tray
	 * @param copies number of copies to be printed
	 * @param duplex duplex mode or not
	 * @param collated collated or not
	 * @param printJobName name of the print job as displayed in the report queue
	 * @param locale the locale used for the printJobName
	 */
	public void print(JasperPrint jasperPrint, String printerName,
			String trayName, int copies, boolean duplex, boolean collated, String printJobName,
			Locale locale) {

		// ----------------------------------------------------
		// lookup printer by name
		// ----------------------------------------------------
		logger.info("lookup printer by name: " + printerName);
		PrintService printService = lookupPrintService(printerName);
		if (printService == null) {
			Utils.throwRuntimeException("printer not found:" + printerName);
		}

		// create a new print job
		PrinterJob printerJob = PrinterJob.getPrinterJob();

		logger.debug("setPrintService()");
		try {
			printerJob.setPrintService(printService);
		} catch (PrinterException e) {
			Utils.throwRuntimeException("Could not set printService");
		}

		// ----------------------------------------------------
		// create parameters for this print job
		// ----------------------------------------------------
		PrintRequestAttributeSet printRequestAttributeSet = new HashPrintRequestAttributeSet();

		logger.debug("lookupMedia(" + trayName + ")");
		// MEDIA TRAY
		Media media = lookupMedia(printService, trayName);
		if (media == null) {
			Utils.throwRuntimeException("media not found:" + trayName);
		}
		if (!validateAttribute(printerJob, media, null)) {
			logger.warn("tray not validated: " + trayName);
		}
		logger.debug("set media to: " + trayName);
		printRequestAttributeSet.add(media);

		// printRequestAttributeSet.add(MediaTray.MIDDLE);
		// Druckerschacht
		// logger.debug("set media tray: MAIN");
		// printRequestAttributeSet.add(new MediaTray(MediaTray.MAIN));

		// COPIES
		logger.trace("set copies: " + copies);
		if (!validateAttribute(printerJob, new Copies(copies), null)) {
			logger.warn("copies not validated: " + copies);
		}
		printRequestAttributeSet.add(new Copies(copies));

		// DUPLEX
		logger.trace("set duplex: " + duplex);
		if (duplex) {
			if (!validateAttribute(printerJob, Sides.DUPLEX, null)) {
				logger.info("Sides.DUPLEX *NOT* validated");
			}
			printRequestAttributeSet.add(Sides.DUPLEX);
		}

		// http://docs.oracle.com/javase/1.4.2/docs/api/javax/print/attribute/SetOfIntegerSyntax.html
		/*
		 * logger.debug("set pageRanges(1)"); printRequestAttributeSet.add(new
		 * PageRanges(1, 1)); if (validateAttribute(job, new PageRanges(1, 1),
		 * null)) { logger.info("PageRanges(1) validated"); } else {
		 * logger.info("PageRanges(1) *NOT* validated"); }
		 */

		// COLLATED
		logger.trace("set collated: " + collated);
		if (collated) {
			if (!validateAttribute(printerJob, SheetCollate.COLLATED, null)) {
				logger.info("SheetCollate.COLLATED *NOT* validated");
			}
			printRequestAttributeSet.add(SheetCollate.COLLATED);
		}
		
		// PRINT JOB NAME
		if (!printJobName.isEmpty()){
			logger.trace("set printJobName: " + printJobName);
			if (!validateAttribute(printerJob, new JobName(printJobName, locale), null)) {
				logger.warn("printJobName not validated: " + printJobName);
			}
			printRequestAttributeSet.add(new JobName(printJobName, locale));
		}
		
		/*
		 * logger.debug("set format A4");
		 * printRequestAttributeSet.add(MediaSizeName.ISO_A4); if
		 * (validateAttribute(job, MediaSizeName.ISO_A4, null)) {
		 * logger.info("MediaSizeName.ISO_A4 validated"); } else {
		 * logger.info("MediaSizeName.ISO_A4 *NOT* validated"); } if
		 * (validateAttribute(job, MediaSizeName.ISO_A0, null)) {
		 * logger.info("MediaSizeName.ISO_A0 validated"); } else {
		 * logger.info("MediaSizeName.ISO_A0 *NOT* validated"); }
		 */

		// ----------------------------------------------------
		// Use JRPrintServiceExporter
		// ----------------------------------------------------
		logger.trace("create JRPrintServiceExporter()");
		JRPrintServiceExporter printExporter = new JRPrintServiceExporter();
		SimplePrintServiceExporterConfiguration configuration=new SimplePrintServiceExporterConfiguration();
		
		// set parameters for the service exporter
		// use a jasperPrintList so that pageRanges are not suppressed

		ArrayList<JasperPrint> jasperPrintList = new ArrayList<JasperPrint>();
		jasperPrintList.add(jasperPrint);

		printExporter.setExporterInput(new SimpleExporterInput(jasperPrint));

		/* We set the selected service and pass it as a parameter */
		configuration.setPrintService(printService);
		configuration.setPrintServiceAttributeSet(printService.getAttributes());
		configuration.setPrintRequestAttributeSet(printRequestAttributeSet);
		configuration.setDisplayPageDialog(Boolean.FALSE);
		
		// display the print dialog depending on the configuration 
		// setting in the application.properties file
		if (AppConfig.getInstance().displayPrintDialog){
			configuration.setDisplayPageDialog(Boolean.TRUE);
		}else{
			configuration.setDisplayPageDialog(Boolean.FALSE);
		}
		
		printExporter.setConfiguration(configuration);

		logger.trace("exportReport()");
		try {
			printExporter.exportReport();
		} catch (JRException e) {
			Utils.throwRuntimeException(e.getMessage());
		}

	}

	/**
	 * @return true if the attribute is supported on the current PrintService
	 */
	private boolean validateAttribute(PrinterJob printJob, Attribute att,
			PrintRequestAttributeSet attributeSet) {
		// return printJob.getPrintService().isAttributeValueSupported(att,
		// DocFlavor.BYTE_ARRAY.POSTSCRIPT, attributeSet);
		return printJob.getPrintService().isAttributeValueSupported(att, null,
				null);

		// byte_array.postscript
		// service_formatted.pageable
	}

}
