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
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

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
define('AUTH_KEY',         'qGlBGKhIusm4#F,ryZtrQm`Wq74?vs( UO+?$l0+trb/HErh)]08&;nN~%v},/4*');
define('SECURE_AUTH_KEY',  '6~Vvf=.Q/3Ej]`B8 ?nhM(R) E-88TrM9~.UOqAM:>KBYL #%6+zapjtDi4Y]64o');
define('LOGGED_IN_KEY',    '-YtB/R{I5_:BE<@eI {~]{;)[0#-P3!}+lP{d8,lpy+t_*9b;(z$N(>7ZSl{`rpc');
define('NONCE_KEY',        '@Cd6D.g,}[doeVS{LEb$C<yvq(5cV:aX{Pe{?il{->)n9bCSyP1ccd_@v*ZvnrVI');
define('AUTH_SALT',        'sq.]QfI<aJpvDkZoucwWboGx0Y^PHmZ^J`c?R_*eN3EGMMBx!^4&B;je|G[<Y&2I');
define('SECURE_AUTH_SALT', '2Z Ijgv1NK?`q5|VJQBn|wot8<`#iu+L-]oPCF-&?-hu%(.>lE;6?:]ub_td6>bk');
define('LOGGED_IN_SALT',   'IK$n!_Lm2,&F+M`]#,+q=Oy_o8*_{ 5$;a##Z1.0)Yr@h{y2]j&>sB6rhsdtj^sc');
define('NONCE_SALT',       'XsaE,GuhVzl/<6NLj~t!vE+]_J;u7ha+TAl3yC^%I1DR%*3yf+!y.W{Apb]v|T&$');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
