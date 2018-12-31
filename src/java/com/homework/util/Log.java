package com.homework.util;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Log {

    private static Logger logger = LogManager.getLogger(Log.class);

    public void setInfo(String a) {
        logger.info(a);
    }

    public void setError(String a) {
        logger.error(a);
    }
}