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
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'MYSQL_DATABASE_NAME' );

/** Database username */
define( 'DB_USER', 'MYSQL_USER' );

/** Database password */
define( 'DB_PASSWORD', 'MYSQL_PASSWORD' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

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
define('AUTH_KEY',         '+AV.Br<AA@aA#[{D2+Q!=_+=oKpg+l]j$anY4S-rv1ykHXwSK^qE{Y,L:+(dK|_k');
define('SECURE_AUTH_KEY',  'JE0fTCe+.D{9K~?6_?Ohd1jj>xQ*`lOITK.%q-//[9#xF{rH?YZ -}~IK)JP5=oF');
define('LOGGED_IN_KEY',    '3D#M5[+AdCm5A!$~Dz);Oq|Ax}]iBMG7d$AeQ$%^(XuQ~l;]._22?%oo~*iusj|/');
define('NONCE_KEY',        'ow]K.1sG~hBnDZ0&k~7A{[z_AM98z6X+9iYf,k*U _I7-N},?7iq9jYu0Z.Pv# s');
define('AUTH_SALT',        'H#AJHOvz5N(tS:ciw:!!r^]iz!~SI9.lXL8KKjB7@+^}#EIAY- u-E2)+@z+GV5v');
define('SECURE_AUTH_SALT', ')+e2-kJ+t]n9-g1|.d.GV*EFnrbEC&r+Pq(SGV-tJQSaW+?^jykSd8u`*WG@H=7%');
define('LOGGED_IN_SALT',   'u(YM&[nQ4y*.e0Kgkh-|&o,YOI9/Y@SQS7ND_]MFYly_dmJ!..&ydldX]&0`?V{$');
define('NONCE_SALT',       '{S(#K4G1wV;n[t<cbyct-3<)NpG>|2n)CSnHQtL-wi+o/m0/5uQDP>dQmfc^JrnW');


/**#@-*/
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', 6379);
define('WP_CACHE', true);


/**
 * WordPress database table prefix.
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
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', false);
/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';