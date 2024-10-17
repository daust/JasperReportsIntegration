package de.oc.utils;

import java.net.UnknownHostException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SecurityUtils {
	private static Logger logger = LogManager.getLogger(SecurityUtils.class);

	   // public static final String key1 = "Bar12345Bar12345"; // 128 bit key
    public static final String key2 = "ThisIsASecretKet";

    public static String padRight(String s, int n) {
        return String.format("%1$-" + n + "s", s);
    }

    public static String padLeft(String s, int n) {
        return String.format("%1$" + n + "s", s);
    }

    public static String getKey1() {
        String key1 = "";
        String localhostname = "";

        try {
            localhostname = java.net.InetAddress.getLocalHost().getHostName();
        } catch (UnknownHostException e) {
        }

        if (localhostname.length() > 16) {
            localhostname = localhostname.substring(0, 16);
        }

        key1 = padRight(localhostname, 16).replace(" ", "|");

        return key1;
    }

    // if it is already encrypted, then do nothing
    // if it is NOT already encrypted, then use method 1:
    public static String encryptPWD(String pwd) {
        pwd = pwd.trim();

        if (pwd.startsWith("1:")) {
            // password is encrypted with method 1 ... do nothing
        } else {
            // not encrypted => ENCRYPT!
            pwd = "1:" + Encryptor.encrypt(getKey1(), key2, pwd);
        }

        return pwd;
    }

    public static String decryptPWD(String pwd) {

        if (pwd != null) {
            if (pwd.startsWith("1:")) {
                // password is encrypted with method 1
                String encPwd = pwd.substring("1:".length());
                pwd = Encryptor.decrypt(getKey1(), key2, encPwd);
            } else {
                // not encrypted => do nothing
            }
        }

        return pwd;
    }

	

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
