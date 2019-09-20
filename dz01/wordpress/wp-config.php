<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'techadmin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'techadmin' );

/** MySQL hostname */
define( 'DB_HOST', 'db' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
#define( 'AUTH_KEY',         'put your unique phrase here' );
#define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
#define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
#define( 'NONCE_KEY',        'put your unique phrase here' );
#define( 'AUTH_SALT',        'put your unique phrase here' );
#define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
#define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
#define( 'NONCE_SALT',       'put your unique phrase here' );

define('AUTH_KEY',         '^!M9J3}y)z5+YyL CwWcdp[{)}v8`~%:?+WlMILK.@ifQ4Iz-KYmIHS@RQ2M+|cC');
define('SECURE_AUTH_KEY',  '`%SFG,+Dm,>3l0Ml5&qX$Y+n;5p)+?WLeEfg|g>X~pQA<hZK}dO0`cLf@t+/$&aX');
define('LOGGED_IN_KEY',    '!D&KL7~gtR!+6F79${W7=-wdnY;a[<{C9*|Z7K}qHd9!N~ZJ>(p<tIt=dA}H@|dR');
define('NONCE_KEY',        'T<H[^(gC|J;XHs?u6P2(RcaI|9T/ -7tk4/|jZQiG@?3r^NUqf PwS*kAs+gqx R');
define('AUTH_SALT',        'TeJLc>x ^g$Azk$-TzY~wBr7SX aNlx^x{;,y.6!`+YIPiScox/T,2@]sju1q;[)');
define('SECURE_AUTH_SALT', '`7Be,fp4CrmFRWuuQl!newp#-+WGpQ]w,(p9iQ=az=Q6Y-OzWd*$Owr_=;gK{VZq');
define('LOGGED_IN_SALT',   'SIl@`yq5-:/g~{Vh)tsBJ_a@;.O/71{KcTJMP#4EF= ]@y1-:s[a)KY hpNNj[^N');
define('NONCE_SALT',       'x$U4gIFmjkz|b}xg>Z|dIk-s%`9|tlY[iKgjWB724-c-Jmk(?+!hz5g!0kP*r3|h');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
