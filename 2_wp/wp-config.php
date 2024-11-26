<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpressDB' );

/** Database username */
define( 'DB_USER', 'jj' );

/** Database password */
define( 'DB_PASSWORD', 'jj' );

/** Database hostname */
define( 'DB_HOST', 'mariadb:3306' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'Q;Gx6<r:q_,h@ /tC.>tV}>56IyX:[_PbF#o5T%>sLF/,s;@l@qe-@Di5T-NZ8<1' );
define( 'SECURE_AUTH_KEY',   'aG$;d3J]J>,z`1?oLhis#<mH#i>-@bQe}ly`-SJi`=EwFou)}WqI{$I0kCw,Lk=e' );
define( 'LOGGED_IN_KEY',     '<R]{6<J70GtWeF2T_%wa8f?Jt]?VIa@c!b;psXqQo9UdrGuD7?gaayx+4CHD(GA4' );
define( 'NONCE_KEY',         '>OTsd+[dM!-Q9|WT@1Pc!dQYtFZjt}WcC,h1|C+!-K8b5qmK1>Y6.q #xq0qjT4a' );
define( 'AUTH_SALT',         'WgA:HN YxpZ5P`iS*G92Q5jF3}m#>9v%=F>;3h9CR]9ggoMJm4k|_W]sBMf{[yfo' );
define( 'SECURE_AUTH_SALT',  '{!xyPc2/$5)]Iy28wE5c+R=Ia4r!JbLsAsMf+_%VnG {]<nPxh78h]PuCodfl;qk' );
define( 'LOGGED_IN_SALT',    'vL6l!b0$_mFWkFIxwTD`M%]JC*Fy=ot ^!nL/]o`Z+5H.#^-_TM! :V]LD+sGgc`' );
define( 'NONCE_SALT',        '_Hg Oy_id?S.n9><)8tII?k;YOFu^EHtm+/6=p*7_4L1o[`Q=HS%_&S@GW|2J$k0' );
define( 'WP_CACHE_KEY_SALT', 'l!_a=6D<4Jc>uWbwu/rY7.vX^l9GVZE{WN@7bG.Ka:Y[7Txw3@=pk.$JY&jyv h5' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
