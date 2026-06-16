<?php
// error_reporting(0);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);



/*======CONFIG LOCAL========
============================*/





// define("SITE_URL", "http://localhost/led-global/");
// define("ADMIN_URL", "http://localhost/led-global/lp/loginpanel");
// define("ROUTER_URL", "http://localhost");
// define("ROUTER_SUB_URL", "/led-global");


/*======DBCONFIG REMOTE========
============================*/
 

define("SITE_URL", "http://localhost/grayscale/");
define("ADMIN_URL", "http://localhost/grayscale/lp/loginpanel/");
define("ROUTER_URL", "http://localhost/grayscale/");
define("ROUTER_SUB_URL","/grayscale");


define("SITE_TITLE", "led-global");
define("XCBPFNAME", "cCMS");
define("XCBPFCONSOLENAME", "led-global");
define("XCBPFCONSOLELOGO", SITE_URL . "assets/images/zeronify-icon.png");
define("XCBPFVERSION", "v3.6");
define("XCBPFSUPPORTURL", "https://xctllp.com");
define("XCBPFMETANAME", "BACKPOOLFRAMEWORKv3.6");
define("USERACCOUNTLOCKDURATION", (2 * 60 * 60));
define("MAXFAILEDNOLOGIN", (7));



// All login attempts are counted from the past 2 hours. 

/*======DBCONFIG LOCAL========
============================*/

// Allow overriding DB credentials via environment variables when hosting remotely.
// Env names: DB_HOST, DB_USER, DB_PASSWORD, DB_NAME
define("DBHOST", getenv('DB_HOST') ? getenv('DB_HOST') : "localhost");
define("DBUSER", getenv('DB_USER') ? getenv('DB_USER') : "root");
define("DBPASSWORD", getenv('DB_PASSWORD') ? getenv('DB_PASSWORD') : "");
define("DATABASE", getenv('DB_NAME') ? getenv('DB_NAME') : "grayscale");
// DB engine: 'mysql' (default) or 'pgsql' for PostgreSQL
define("DB_ENGINE", getenv('DB_ENGINE') ? getenv('DB_ENGINE') : "mysql");
define("CAN_REGISTER", "any");
define("DEFAULT_ROLE", "member");
define("SECURE", FALSE);

/*======DBCONFIG REMOTE========
============================*/

// define("DBHOST", "");
// define("DBUSER", "hgbuvztraf");
// define("DBPASSWORD", "zqSxD8D7cj");
// define("DATABASE", "hgbuvztraf");
// define("CAN_REGISTER", "any");
// define("DEFAULT_ROLE", "member");
// define("SECURE", FALSE);

/*======TIME ZONE LOCAL========
 ============================*/
date_default_timezone_set("Asia/Calcutta");


/*======RECAPTCHA VARIABLES========
 ==================================*/
 
define("RECAPTCHA_SITE_KEY", "");
define("RECAPTCHA_SECRET_KEY", "");
define("CONTACT_MAIL", "");
define("SITE_ADDRESS", "");
define("FORM_PURPOSE", "");
