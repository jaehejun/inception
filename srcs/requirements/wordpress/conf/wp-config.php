<?php

/** install.sh에서 생성함 */


/**
 * WordPress 기본 설정 파일
 */

//  데이터베이스 설정  //
/** WordPress가 사용할 데이터베이스 이름 */
define('DB_NAME', getenv('WORDPRESS_DB_NAME'));

/** 데이터베이스 사용자명 */
define('DB_USER', getenv('WORDPRESS_DB_USER'));

/** 데이터베이스 암호 */
define('DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD'));

/** 데이터베이스 호스트 */
define('DB_HOST', 'WORDPRESS_DB_HOST');

/** 데이터베이스 문자 집합 */
define('DB_CHARSET', 'utf8');

/** 데이터베이스 콜레이션 */
define('DB_COLLATE', '');

/** Authentication Unique Keys and Salts */
// define('AUTH_KEY',         'put your unique phrase here');
// define('SECURE_AUTH_KEY',  'put your unique phrase here');
// define('LOGGED_IN_KEY',    'put your unique phrase here');
// define('NONCE_KEY',        'put your unique phrase here');
// define('AUTH_SALT',        'put your unique phrase here');
// define('SECURE_AUTH_SALT', 'put your unique phrase here');
// define('LOGGED_IN_SALT',   'put your unique phrase here');
// define('NONCE_SALT',       'put your unique phrase here');

define('AUTH_KEY',         '#|z^ga=S]}GFoIbgr*]jwTktsx+>* DJG.gqgvf[?KeVRoF6om~^MfgkI1 (2!4:');
define('SECURE_AUTH_KEY',  'fvr]!-1 =n%{+LUT-+lSX5B3);dePu+2~#|Y>[Dx6$>+Wn/ `q>{Kp.ot8+2p+.O');
define('LOGGED_IN_KEY',    'KG+^QRZw_O*}KLF-q1swN|9{$v4l{/!{@y,@x&;nBWV5q1I4h@>#[+m9}*mccS #');
define('NONCE_KEY',        'V4._2f{^B-^O$rm-W}jSuZ|p(9~_h7L Zt6dOC<7G/7Jv{GVB*.7U/[jKDID*Kb4');
define('AUTH_SALT',        'Dv-Re{&)||wrXt=ylvy]8Nu$hGAo^|{g>m&QT-lNO0QMvO->oHKU-3kr0h+E)+*C');
define('SECURE_AUTH_SALT', 'E(Gz7uY_/UMY5S[;T0S5$jGd`5hRyH!=N0|K>0,VB|^7.+S0:Nf}gJ@--u4;|#*6');
define('LOGGED_IN_SALT',   '05`P[2,IymykJ9-SW]-]ivw4).tv2w]Dl2W:)],PLZ1M!8C+fm/e7=/cS( Ya,H)');
define('NONCE_SALT',       '^6cP[y-{f4arfm.{<+2HFrA-NVYEP3%B-DoN}%1N_JCIemO^dD4IxpnS&RIw/Tm5');

/** WordPress 데이터베이스 테이블 접두사 */
$tableprefix = 'wp';

/** 개발자를 위한 WordPress 디버깅 모드 */
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', false);
@ini_set('display_errors', 0);

/* 여기까지 수정하세요! */

/** WordPress absolute 경로 */
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(FILE) . '/');

/** WordPress 변수와 필요한 파일 설정 */
require_once(ABSPATH . 'wp-settings.php');