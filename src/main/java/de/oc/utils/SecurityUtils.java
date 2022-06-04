package de.oc.utils;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SecurityUtils {
	private static Logger logger = LogManager.getLogger(SecurityUtils.class);


	public static boolean isIpAddressAllowed(String [] ipAddressesAllowed, String ipAddressToCheck) {
		// if parameter has not been configured in the file => ALLOW ACCESS
		if (ipAddressesAllowed.length == 0) {
			return true;
		}
		// if parameter is empty, e.g. ipAddressesAllowed=
		if (ipAddressesAllowed.length==1 && ipAddressesAllowed[0].trim().isEmpty())
			return true;

		logger.debug("check ip address: " + ipAddressToCheck + " against "+StringUtils.convertStringArrayToString(ipAddressesAllowed, ", "));
		for (int i = 0; i < ipAddressesAllowed.length; i++) {
			if (ipAddressesAllowed[i].toLowerCase().trim().equals(ipAddressToCheck.toLowerCase().trim()))
				return true;
		}
		logger.debug("ip address rejected: " + ipAddressToCheck);
		return false;
	}
}
