package tests.com.foo;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
 
public class Bar {
  static final Logger logger = LogManager.getLogger(Bar.class.getName());
 
  public boolean doIt() {
    logger.traceEntry();
    logger.error("Did it again!");
    logger.traceExit();
    
    return false;
  }
}
