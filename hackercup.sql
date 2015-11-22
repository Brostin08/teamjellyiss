-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2015 at 05:19 AM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hackercup`
--
CREATE DATABASE IF NOT EXISTS `hackercup` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hackercup`;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('718f443b13c059d08ad4803b3a0de1ec58ce1bef', '::1', 1448106343, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383130363239333b),
('5bec9d022cbf43caa09ad2225edf480d49ec41b8', '::1', 1448113476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383131333233323b),
('c36851d89887d70898160adc240b443cc70cfbed', '::1', 1448113735, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383131333537383b),
('c49fb8551792c650fc8ff55078a15253e043e026', '::1', 1448116305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383131363330353b),
('c28ab92d81f367816aa6ba4c9d0408da381fe2dc', '::1', 1448120089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383131393831303b),
('34401d107b18620f7089724a2cb4885c6040e024', '::1', 1448120441, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383132303135373b),
('068fcca921b85b1efd4f722954f022716fac2149', '::1', 1448120913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383132303631343b),
('c7f8f1d692e467d9ed8364fbf17480a469a269ae', '::1', 1448129124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383132393132343b),
('11bba34841201c9ed996361bcd987178567bbc32', '::1', 1448133416, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133333334383b),
('d746d6973a6acf5813b4a65f6de1c6c5ce10e3a8', '::1', 1448135444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133353135333b),
('a0581106ac68cb611887d9dbbb8ea222cd621e74', '::1', 1448135631, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133353530333b),
('7eba49c96674eb578403c3f78bacce18023bafba', '::1', 1448136192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133353839363b),
('192db829860aea3967d27cc8775c3d57c8251406', '::1', 1448136522, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133363232393b),
('23f6c48c7afcaafa90649573cb64c3b8670ff7cd', '::1', 1448136805, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133363533323b),
('5235d9b870b8dd63cb8805b1243dd01c59a723a8', '::1', 1448137081, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133363833373b),
('f0674efd220f06efea1eaa0660121fafd380cb3f', '::1', 1448137513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133373234313b),
('8a1931845faa4e4719f16025c371218a2694e67d', '::1', 1448137967, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133373638313b),
('4de6f3da3ff04fc753c9952a5566dacff6f74f43', '::1', 1448138304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133383130333b),
('850f1387921f5c8c50a085d8d19ad2471d77ad0b', '::1', 1448138673, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133383433313b),
('9ca9ee086bcfa00b491f600d0a2fbe9389fe0054', '::1', 1448139415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133393131383b),
('0f01caadf9dd2658f6c7f6c36306fab1b72a777e', '::1', 1448139603, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133393532373b),
('87d6afbf3d0b8e812c6b5be6af1ca92c9e6bdcf1', '::1', 1448140163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133393838353b),
('2e362e561c382f502034ead4292dd75f2e1d4e5e', '::1', 1448140475, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134303234303b),
('c0d2ee186eab8d86a4a5e596cad8be59c448ede3', '::1', 1448140823, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134303536383b),
('512c80fd71ce2b22881923ce89d17487bd825240', '::1', 1448141190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134303839323b),
('bfe56c8cc6c3ee469e1620e3e9abb86dcd291040', '::1', 1448141648, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134313438373b),
('b8261d94b6641130489f3253c05312910cc36a8b', '::1', 1448141954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134313935343b),
('287df67d34d14e58ba1a9b3a629dff8dd90d369e', '::1', 1448142696, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134323639363b),
('42ca18a2cb43d451e72aaf21e4ca5aee92cc2eef', '127.0.0.1', 1448143539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134333235393b),
('aace095674fd6d719538a7597b17d5542b24cbd2', '::1', 1448143813, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134333536303b),
('670cd2f968165ee797f9c542edaa68ce044eeba9', '::1', 1448143937, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134333837343b),
('c91c2eac7177882160769d3fb3c64b0b100939e9', '::1', 1448144339, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134343233313b),
('d2021566f15980a13ecb05f6f7b48e5ef72cfc02', '::1', 1448144965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134343734313b),
('3c5734e77d3ff4c300162b39cf3c2f1d73a675f1', '::1', 1448145222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134353139343b),
('74c27b87eaa26f5543812ee1fe3ee85fd67cc3a9', '::1', 1448146087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134353839353b),
('51730affed19b2efbda6e079f264a43100a341c7', '::1', 1448146901, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134363630353b),
('fa8ca808b215a08ec6c66eee2b636d224f030b26', '::1', 1448147100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134363938343b),
('a76e9390da87942f953ea9102707c22223321d08', '::1', 1448147498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134373339353b),
('0209d1aaf1d187fb5dc97d7713c12d52cb465f7f', '::1', 1448148097, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134383034343b),
('a41b99edd3934ac788176f71ed8b64f204371e32', '::1', 1448148469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134383338323b),
('150bc651b147d388d14cd507cecc856293882d7d', '::1', 1448149607, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134393331313b),
('654d4fa742bae4b7e7bc6b8b0378dab40ec4e83f', '::1', 1448149853, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383134393634343b),
('9e6f38e4222bde1f8d122910bdd6265359606ba6', '192.168.43.199', 1448150159, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135303030373b),
('6f3827c943ac6a1701b6af31b70e180c8555b02b', '::1', 1448150439, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135303233323b),
('a5a505c4800047dc3ad505e9782393096c62b331', '192.168.43.199', 1448150490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135303338383b),
('c3f84d05aec3520d8dc1e617402630b095a71e4b', '::1', 1448150800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135303537303b),
('cc9ff1058044f3cfdd692e70ed1365103126651e', '::1', 1448151019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135303930353b),
('06958505eae85933244726e1b970f29f65b95c89', '::1', 1448151561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135313238333b),
('6034d9023e688a92225ff9d72a0173d10683131c', '::1', 1448151991, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135313639323b),
('1f56b334bd9bdc5b637c5bb403da4164314bb053', '::1', 1448152291, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135323030303b),
('1ce2480718dfff9375eea93308b8cb4a59661adf', '::1', 1448152729, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135323433383b),
('af42c8b0d8728eec06d3566afc886eb22481191f', '::1', 1448152969, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135323738303b),
('b75e5b54f32791eb3cf2e7b576f5afd5bc0900a9', '::1', 1448153312, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135333136323b),
('9f82ae111cc71f65159accffe6077f3cd3946659', '::1', 1448153581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135333532353b),
('790f22be92180d7473e2b3525274280523e97715', '::1', 1448154270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135343030323b),
('0c30950fffb42a4a27137f44151f5057422da0c9', '::1', 1448154593, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135343430313b),
('0031bd8d57a6deec5a1e326581d4dd7497fea909', '::1', 1448154975, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135343735323b),
('d9b54b76f1ce52ce45d3b7875ff276823ada139d', '::1', 1448155322, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135353130393b),
('cbc09168d72c77842216830927f883d211975308', '::1', 1448155753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135353436353b),
('aafcbde1c4b0cf2a2f5ad59a804c7dd9b0dee8aa', '::1', 1448156057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135353738343b),
('5fe80d10ab8c5a13dbc664151088fea38c01e4aa', '::1', 1448156407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135363130373b),
('bfe5e3efd668298f334d93c9f8f664d2437ab07e', '::1', 1448156646, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135363431383b),
('6f991d059dd0d4ab3f2d2db267c1f3d4c8552ea2', '::1', 1448157267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135373134333b),
('9a5dcb76709c9dbc5527893c6cb041ecac638394', '::1', 1448157592, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135373439353b),
('5f35e7fa1b2694a90292d7303d0b91c18129668a', '::1', 1448158306, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135383033353b),
('c84ca43c911fcf65003696bcc1bfb77946f6ce4e', '::1', 1448158557, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135383432383b),
('064ac26559e59517403af7d165a53a728b86fb44', '::1', 1448159136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135383835323b),
('abdaa52e6c470c2c393cbfd13a4554a9bf645183', '::1', 1448159181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135393138313b),
('31848b0f5fd5ec57a15184be472d69eab3ca5442', '::1', 1448159624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135393533383b),
('7b611dd4bf764890d0925413a5fdcf4f2ef2f4dd', '172.16.1.57', 1448159917, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383135393931373b),
('41b4b4fef9926af1d22f1eebda1343d784324e6c', '::1', 1448160301, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383136303037343b),
('d956bd213c27540aac34e2a33a0df0406a72cb5b', '::1', 1448160671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383136303434353b),
('7f4f77c24bad8dff63204a197028adc9e58e9891', '::1', 1448161022, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383136303737303b),
('262d78645e5832b9f37c48dcdec475b9ae2955e5', '::1', 1448161384, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383136313038343b),
('5049a1ff6f79d94ce7ab2067aa1594a1929bbe73', '::1', 1448161460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383136313434323b),
('76d89bfcf90e4cd234c638c4ef02a4cf374a3915', '::1', 1448161900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383136313735363b),
('92830f96a2d05750ce4f7ab9a88a4e69d6e766b0', '::1', 1448162369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383136323236363b),
('ed3e5e0f369f79186e06d056ae15f61d35fb5fc8', '::1', 1448162965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383136323636383b),
('34b1a0276c21e570c68abf809051827aa664b7a2', '::1', 1448163296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383136333031373b),
('e632f540f494a534ded89e0506efba16972ba579', '::1', 1448163477, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383136333333323b),
('e6a87f667590ff2e4e3329b75a2670d17952aa7a', '::1', 1448164285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383136343137373b);

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE IF NOT EXISTS `data` (
  `project_id` varchar(20) NOT NULL,
  `project_name` varchar(250) NOT NULL,
  `project_location` varchar(250) NOT NULL,
  `project_contractor` varchar(250) NOT NULL,
  `project_office_assigned` varchar(250) NOT NULL,
  `project_fund_source` varchar(20) NOT NULL,
  `project_cost_000` int(255) NOT NULL,
  `date_start` varchar(15) NOT NULL,
  `date_complete_orig` varchar(15) NOT NULL,
  `date_complete_actual` varchar(15) NOT NULL,
  `status_percent` float NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `like_count` int(11) DEFAULT NULL,
  `dislike_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`project_id`, `project_name`, `project_location`, `project_contractor`, `project_office_assigned`, `project_fund_source`, `project_cost_000`, `date_start`, `date_complete_orig`, `date_complete_actual`, `status_percent`, `latitude`, `longitude`, `like_count`, `dislike_count`) VALUES
('NC0113F00078', 'Construction/Rehabilitation of Drainage Systems along Bonifacio Drive from Anda Circle to Bonifacio Drive Interchange  Port Area Manila CONSTRUCTION', 'Manila District 5,South Manila District Engineering Office,NCR', 'AKH CONSTRUCTION & TRADING CORP.', 'South Manila District Engineering Office,NCR', 'FC LUMPSUM', 12728, '9/13/2013', '1/13/2014', '1/13/2014', 100, 14.5908605, 120.9697276, 0, 0),
('NC0113F00097', 'Dredging of Maricaban Creek Retarding Pon  Pasay City OTHERS', 'Pasay City,South Manila District Engineering Office,NCR', 'By Administration', 'South Manila District Engineering Office,NCR', 'DPWH', 3000, '7/15/2013', '6/15/2015', '6/15/2015', 100, 14.392988, 121.016121, 0, 0),
('NC0113H00158', 'Concreting and Lane Line Marking along Diokno Boulevard (Buendia Extension to Senate Gate)  Pasay City PAVED (CONCRETE) TO PAVED (CONCRETE)', 'Pasay City,South Manila District Engineering Office,NCR', 'ARMANDO U. KHONG HUN GEN. CONTR., INC.', 'Regional Office,NCR', 'DPWH', 47257, '9/17/2013', '1/24/2015', '1/24/2015', 100, 14.4690685, 120.9026387, 0, 0),
('NC0114F00024', 'Flood Control in Manila City 2nd LD - Juan Luna Street  - C 3906.50 to 4598.25 (South Bound) REHABILITATION', 'Manila District 2,North Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'North Manila District Engineering Office,NCR', 'FMSD', 14468, '8/11/2014', '3/10/2015', '', 80.25, 14.6161219, 120.968221, 0, 0),
('NC0114F00077', 'Dredging of Estero de Magdalena from Estero dela Reina to Recto DREDGING/DESILTING', 'Manila District 3,North Manila District Engineering Office,NCR', 'ST. GERRARD CONSTRUCTION', 'North Manila District Engineering Office,NCR', 'DDCD', 5103, '9/25/2014', '2/17/2015', '2/17/2015', 100, 14.6070174, 120.970295, 0, 0),
('NC0114F00078', 'Estero de San Lazaro (Dredging from Estero dela Reina to Recto DREDGING/DESILTING', 'Manila District 3,North Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'North Manila District Engineering Office,NCR', 'DDCD', 6781, '9/25/2014', '3/23/2015', '3/22/2015', 100, 14.6180346, 120.9747854, 0, 0),
('NC0114H00006', 'G Tuazon St - Chainage   0000      -      Chainage   0428 RAISING OF GRADE WITH DRAINAGE IMPROVEMENT', 'Manila District 4,North Manila District Engineering Office,NCR', 'ST. GERRARD CONSTRUCTION', 'North Manila District Engineering Office,NCR', 'UPSR', 16606, '9/15/2014', '5/20/2015', '5/11/2015', 100, 14.605672, 120.997701, 0, 0),
('NC0114H00097', 'Local Infrastructure Program - Rehabilitation of Roads - Cavite St.  Brgy. 363  364 and 369  Zone 37  Sta. Cruz  Manila GRAVEL TO PAVED', 'DistrictWide,North Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'North Manila District Engineering Office,NCR', 'RLIP', 6818, '9/15/2014', '2/3/2015', '1/31/2015', 100, 14.6235421, 120.9832425, 0, 0),
('NC0114H00132', 'National Road Lighting Program  Roxas Boulevard (Vito Cruz to P. Burgos Stret)    K0002 + (-670) to K000+197 ROAD FACILITIES (WAITING SHED  ETC.)', 'Manila District 5,South Manila District Engineering Office,NCR', 'NEWBIG FOUR J CONSTRUCTION INC., (FORMERLY FOUR J', 'Regional Office,NCR', 'MVUC', 54264, '12/5/2014', '8/28/2015', '8/28/2015', 100, 14.5314623, 120.9719198, 0, 0),
('NC0115F00026', 'Construction/Maintenance of Flood Mitigation Structures and Drainage System along Madrid St.  C0 to C170  Manila City 3rd LD CONSTRUCTION', 'DistrictWide,North Manila District Engineering Office,NCR', 'MDAN CONSTRUCTION AND TRADING', 'North Manila District Engineering Office,NCR', 'FMSD', 2955, '2/27/2015', '7/11/2015', '5/26/2015', 100, 14.5941764, 120.9704581, 0, 0),
('NC0115F00027', 'Construction of Pumping Station  Retarding Basin and Connecting Drainage - Rehabilitation with Drainage Improvement along S. Reyes St. and x 3rd LD CONSTRUCTION', 'DistrictWide,North Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'North Manila District Engineering Office,NCR', 'FMSD', 7154, '2/23/2015', '6/22/2015', '5/29/2015', 100, 14.6052967, 120.9787089, 0, 0),
('NC0115F00052', 'Construction/Maintenance of Flood Mitigation Structures and Drainage System along Luzon St.  Sampaloc  Manila City 4th LD CONSTRUCTION', 'DistrictWide,North Manila District Engineering Office,NCR', 'NORTHERN BUILDERS', 'North Manila District Engineering Office,NCR', 'FMSD', 37119, '4/14/2015', '12/6/2015', '', 16, 14.6052967, 120.9787089, 0, 0),
('NC0115F00085', 'Proposed Dredging/Improvement of Existing Retarding Pond  Pasay City CONSTRUCTION', 'Pasay City,South Manila District Engineering Office,NCR', 'E.R. RODRIGUEZ CONSTRUCTION', 'South Manila District Engineering Office,NCR', 'FMSD', 109079, '9/1/2015', '8/5/2016', '', 25, 14.5429482, 121.0038303, 0, 0),
('NC0115H00003', 'Local Infrastructure Program - Construction of Brgy. Roads  Brgy 310  Zone 31  Barangays 348 and 349 Zone 35  Sta Cruz  Manila GRAVEL TO PAVED', 'DistrictWide,North Manila District Engineering Office,NCR', 'ST. GERRARD CONSTRUCTION', 'North Manila District Engineering Office,NCR', 'RLIP', 4846, '2/23/2015', '5/23/2015', '5/10/2015', 100, 14.6048471, 120.9816278, 0, 0),
('NC0115H00016', 'Quezon Blvd (LZ)  -  K0003+(199) - K0003+639.70 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,North Manila District Engineering Office,NCR', 'RUBY-JADE CONSTRUCTION', 'North Manila District Engineering Office,NCR', 'UPSR', 11322, '6/9/2015', '7/8/2015', '', 30, 14.6006321, 120.9822891, 0, 0),
('NC0115H00022', 'Local Infrastructure Program-Improvement of Road and Drainage  Brgy. 829 and vicinity  Pandacan  Manila City 6th LD GRAVEL TO PAVED', 'DistrictWide,South Manila District Engineering Office,NCR', 'MRJR CONSTRUCTION & TRADING', 'South Manila District Engineering Office,NCR', 'RLIP', 2805, '6/5/2015', '9/2/2015', '9/2/2015', 100, 14.5888528, 120.9914795, 0, 0),
('NC0115H00039', 'Del Pan Street -  C0 to 221.0 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,North Manila District Engineering Office,NCR', 'ST. GERRARD CONSTRUCTION', 'North Manila District Engineering Office,NCR', 'UPSR', 9120, '3/12/2015', '7/9/2015', '7/7/2015', 100, 14.5957714, 120.9653439, 0, 0),
('NC0115H00043', 'Local Infrastructure Program - Road Rehabilitation  Del Pilar St. and Vicinity Singalong  Manila 5th LD PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,South Manila District Engineering Office,NCR', 'R.E. ORLINA CONSTRUCTION CORPORATION', 'South Manila District Engineering Office,NCR', 'RLIP', 3217, '4/8/2015', '7/6/2015', '7/5/2015', 100, 14.5703923, 120.9930219, 0, 0),
('NC0115H00048', 'Construction/Repair/Rehabilitation/Improvement of Various Infrastructure including Local Projects - Road and Drainage Improvement  M. Roxas and Delpan Streets via Callejon Streets and vicinity  Sta. Ana  Manila City 6th LD PAVED (CONCRETE) TO PAVED (', 'DistrictWide,South Manila District Engineering Office,NCR', 'MPJR BUILDERS COMPANY', 'South Manila District Engineering Office,NCR', 'VILP', 10690, '4/30/2015', '11/26/2015', '', 92, 14.5957714, 120.9653439, 0, 0),
('NC0115H00050', 'Construction/Repair/Rehabilitation/Improvement of Various Infrastructure including Local Projects - Road and Drainage Improvement  F. Calderon Street to Tejeron Street via Suter Street and vicinity  Sta. Ana  Manila City 6th LD PAVED (CONCRETE) TO PA', 'DistrictWide,South Manila District Engineering Office,NCR', 'SPRING STAR CONSTRUCTION & SUPPLY', 'South Manila District Engineering Office,NCR', 'VILP', 12492, '5/29/2015', '11/24/2015', '', 90, 14.5808566, 121.0112473, 0, 0),
('NC0115H00051', 'Local Infrastructure Program-Improvement of Road and Drainage  Zone 98 and vicinity  Sta. Ana  and Brgy. 866 and vicinity  Pandacan Manila City 6th LD GRAVEL TO PAVED', 'DistrictWide,North Manila District Engineering Office,NCR', 'FRAMECON BUILDERS', 'North Manila District Engineering Office,NCR', 'RLIP', 3765, '5/7/2015', '8/4/2015', '9/2/2015', 100, 14.5833498, 121.002667, 0, 0),
('NC0115H00069', 'National Road Lighting Program (NRLP) Package 8 (Civil Works)  Roxas Boulevard Completion  Roxas Boulevard East Service Road S03341LZ: CO to C479 with exceptions  S03251LZ: K0005+(-239) to K0003+300 with exceptions  S02896LZ: CO to C2453 with excepti', 'DistrictWide,South Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'South Manila District Engineering Office,NCR', 'MVUC', 46938, '9/4/2015', '3/1/2016', '', 33, 14.5514337, 120.987575, 0, 0),
('NC0115S00002', 'Local Infrastructure Program - Construction of School Building  Raja Soliman High School  Manila City 3rd LD   CONSTRUCTION', 'DistrictWide,North Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'North Manila District Engineering Office,NCR', 'RLIP', 18976, '6/9/2015', '11/5/2015', '', 85, 14.5977486, 120.9704756, 0, 0),
('NC0115S00003', 'Local Infrastructure Program - Construction of School Building  Raja Soliman High School  Manila 3rd LD CONSTRUCTION', 'DistrictWide,North Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'North Manila District Engineering Office,NCR', 'RLIP', 18796, '6/23/2015', '11/19/2015', '', 5, 14.5977486, 120.9704756, 0, 0),
('NC0115T00005', 'Local Infrastructure Program - Completion/Improvement/Construction of Multi-Purpose Buildings: Sta. Mesa   Zone 59; Pandacan  Brgy. 849 Zone 93; Punta  Sta. Ana  Zone 100  and San Miguel  Brgy. 642  Zone 66   Manila City 6th LD CONSTRUCTION', 'DistrictWide,South Manila District Engineering Office,NCR', 'AYANA CONSTRUCTION AND TRADING', 'South Manila District Engineering Office,NCR', 'RLIP', 1894, '9/4/2015', '11/2/2015', '', 40, 14.6011162, 121.0153113, 0, 0),
('NC0115T00016', 'Local Infrastructure Program - Construction of Multi-Purpose Building  Brgy. 147 and Brgy. 42  Pasay City Lone District CONSTRUCTION', 'DistrictWide,South Manila District Engineering Office,NCR', 'KPGONZALES CONSTRUCTION SUPPLY AND TRADING', 'South Manila District Engineering Office,NCR', 'RLIP', 3101, '9/17/2015', '2/13/2016', '', 39.2, 14.5605264, 120.995653, 1, 0),
('NC0115T00026', 'Local Infrastructure Program - Construction of Multi-Purpose Buildings (Covered Court)  Barangay 104  Zone 8 Lallana/J.P. Rizal St. Tondo  Manila City 1st LD CONSTRUCTION', 'DistrictWide,North Manila District Engineering Office,NCR', 'BLACKRAM BUILDERS, INC.', 'North Manila District Engineering Office,NCR', 'RLIP', 980, '7/3/2015', '8/31/2015', '8/31/2015', 100, 14.6168157, 120.9447847, 0, 0),
('NC0115T00036', 'Const/Repair/Rehab/Impvt of Various Infrastructure including Local Projects -  Construction of Multi-purpose Building  Barangay 873 Zone 96  Sta. Ana  Brgy. 894 and 896 Zone 99  Punta and Beata Elementary School  Pandacan  Manila City 6th LD CONSTRUC', 'DistrictWide,North Manila District Engineering Office,NCR', 'LE BRON CONSTRUCTION', 'North Manila District Engineering Office,NCR', 'VILP', 4186, '9/9/2015', '3/6/2016', '', 15, 14.5798792, 121.009968, 0, 0),
('NC0115T00049', 'Local Infrastructure Program - Construction of Multi-Purpose Building  Pasay City Cemetery Lone District CONSTRUCTION', 'Pasay City,South Manila District Engineering Office,NCR', 'VIVID CONSTRUCTION INC.(FORMERLY VIVID CONSTRUCTIO', 'South Manila District Engineering Office,NCR', 'RLIP', 3000, '4/30/2015', '9/24/2015', '9/24/2015', 100, 14.580165, 121.012503, 0, 0),
('NC0115T00056', 'Local Infrastructure Program - Construction of Multi-Purpose Building  Barangay 149  Barangay 150  Zone 13 (Marco) Manila City 2nd LD CONSTRUCTION', 'Manila District 2,North Manila District Engineering Office,NCR', 'HOUSEROCK BUILDERS & TRADING', 'North Manila District Engineering Office,NCR', 'RLIP', 6645, '3/27/2015', '10/25/2015', '10/25/2015', 100, 14.6212892, 120.9687424, 0, 0),
('NC0210H00309', 'Construction of C-5 Extension Project (SLEX/West Service Road to Multinational Avenue)  Cities of Pasay and Para?aque GRAVEL TO PAVED', 'DistrictWide,Metro Manila 2nd District Engineering Office,NCR', 'NEWINGTON BUILDERS, INC.(FOR: E. GARDIOLA CONSTRUC', 'Regional Office,NCR', 'DPWH', 116778, '12/27/2011', '9/6/2012', '', 60.201, 14.4658526, 121.0275719, 0, 0),
('NC0213H00442', 'Rehabilitation?reconstruction/Stregthening of Bridge. Sucat Interchange East and West Bound along MSDR East Service Road  Brgy Sucat  Muntinlupa City RETROFITTING/REHABILITATION/STRENGTHENING', 'Muntinlupa City,Las Pi?as-Muntinlupa District Engineering Office,NCR', 'L.R. TIQUI BUILDERS, INC.', 'Las Pi?as-Muntinlupa District Engineering Office,NCR', 'SAVE', 16715, '4/10/2014', '12/28/2014', '', 78, 14.4542915, 121.0405786, 0, 0),
('NC0214F00055', 'Construction/Rehabilitation of Flood Control in Para?aque City 1st LD - Upgrading / Box Culvert along Villanueva Creek  Schillings Lane (Villanueva Village)  Brgy. San Dionisio CONSTRUCTION', 'Para?aque City I,Metro Manila 2nd District Engineering Office,NCR', 'N.C. AGUILAR CONST. & SUPPLY INC.', 'Metro Manila 2nd District Engineering Office,NCR', 'FMSD', 6417, '9/8/2014', '4/14/2015', '4/14/2015', 100, 14.475764, 121.001345, 0, 0),
('NC0214F00137', 'Construction of box culvert and rehabilitation of Rogan Creek  Brgy. Maharlika  Taguig City CONSTRUCTION', 'Taguig City,Metro Manila 1st District Engineering Office,NCR', 'HONEYVILLE CONSTRUCTION', 'Metro Manila 1st District Engineering Office,NCR', 'FMSD', 17785, '9/3/2014', '3/1/2015', '', 11, 14.4961424, 121.0542005, 0, 0),
('NC0214F00141', 'Valenzuela-Obando-Meycauayan Flood Control Project  Valenzuela - Improvement of earthdike along the left bank of Polo River  Valenzuela City OTHERS', 'Valenzuela City I,Metro Manila 3rd District Engineering Office,NCR', 'E.R. RODRIGUEZ CONSTRUCTION', 'Metro Manila 3rd District Engineering Office,NCR', 'FMSD', 50000, '9/7/2014', '6/25/2015', '6/25/2015', 100, 14.6795702, 120.9599228, 0, 0),
('NC0214F00151', 'Improvement/Rehabilitation of Slope Proteection of Naga Creek  Las Pi?as City REHABILITATION', 'Las Pi?as City,Las Pi?as-Muntinlupa District Engineering Office,NCR', 'LMG CONSTRUCTION', 'Las Pi?as-Muntinlupa District Engineering Office,NCR', 'FMSD', 5314, '11/6/2014', '3/4/2015', '3/4/2015', 100, 14.4689596, 120.9778127, 0, 0),
('NC0214F00167', 'Improvement/Upgrading of drainage System  along Daang Maharlika Road in front of Makati Foundry  Madaong Creek  Brgy. Tunasan REHABILITATION', 'Muntinlupa City,Las Pi?as-Muntinlupa District Engineering Office,NCR', 'MRRM TRADING & CONSTRUCTION', 'Las Pi?as-Muntinlupa District Engineering Office,NCR', 'FMSD', 1428, '12/28/2014', '2/10/2015', '2/10/2015', 100, 14.3682374, 121.015131, 0, 0),
('NC0214H00020', 'Gen San Miguel St - K0011  +  (-662)      -      K0011  +  028 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'Caloocan City II,Metro Manila 3rd District Engineering Office,NCR', 'NEWBIG FOUR J CONSTRUCTION INC., (FORMERLY FOUR J', 'Metro Manila 3rd District Engineering Office,NCR', 'UPSR', 21979, '2/3/2014', '6/30/2015', '6/25/2015', 100, 14.6583527, 120.9670083, 0, 0),
('NC0214H00212', 'Construction/Improvement/Widening/Rehabilitation of NAIA Expressway and Other Major Roads in Metro Manila  Including ROW > Improvement/Rehabilitation of San Juan-Santolan Road (Paltok Section) including Right-of-Way  San Juan City WIDENING - PAVED', 'San Juan,Metro Manila 1st District Engineering Office,NCR', '6RM CONSTRUCTION AND DEVT. CORP. (FORMERLY R.R. MA', 'Metro Manila 1st District Engineering Office,NCR', 'WANR', 1992, '11/19/2014', '8/20/2015', '8/20/2015', 100, 14.5274867, 121.0049091, 0, 0),
('NC0215H00067', 'Construction of Taguig Diversion Road to Pateros By-Pass Road  Brgy. Sta. Ana & Brgy. San Roque  Pateros  M.M.   Taguig City-Pateros 1st LD GRAVEL TO PAVED', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'DAHL CONSTRUCTION', 'Metro Manila 1st District Engineering Office,NCR', 'CBPR', 10636, '5/8/2015', '11/4/2015', '', 98, 14.5431172, 121.0675244, 0, 0),
('NC0215H00070', 'Gov A Pascual St  -  K0012+(-570) - K0012+(-410)  K0012+(-310) - K0012+585 CONCRETE REBLOCKING RIGHT LANE', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'KATHA BUILDERS', 'Malabon-Navotas District Engineering Office,NCR', 'SBSR', 2603, '5/5/2015', '6/10/2015', '6/10/2015', 100, 14.6679249, 120.9626781, 0, 0),
('NC0215H00072', 'MacArthur H-way -  K0011+-297 - K0011+003 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,Metro Manila 3rd District Engineering Office,NCR', 'E.L. TORRES CONSTRUCTION AND TRADING', 'Metro Manila 3rd District Engineering Office,NCR', 'UPAR', 15321, '3/17/2015', '9/12/2015', '9/12/2015', 100, 14.69276, 120.9666543, 0, 0),
('NC0215H00075', 'C Arellano St  -  K0012+-698 - K 0011+247 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'C.B. TAMPENGCO CONSTRUCTION & SUPPLY', 'Malabon-Navotas District Engineering Office,NCR', 'UPSR', 8893, '5/5/2015', '10/2/2015', '10/2/2015', 100, 14.6658959, 120.9468622, 0, 0),
('NC0215H00076', 'C-4 Road  -  K0013+(-092) - K0013+000  K0013+090 - K0013+108 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'STRUKTURA TEKNIKA SERVICES CO.', 'Malabon-Navotas District Engineering Office,NCR', 'UPSR', 4046, '5/4/2015', '7/3/2015', '7/3/2015', 100, 14.6554027, 120.9548527, 0, 0),
('NC0215H00081', 'Canumay-Bignay Road  -  Chainage 2034 - Chainage 2937 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,Metro Manila 3rd District Engineering Office,NCR', 'LARSEN-DUTCHER CONSTRACTOR', 'Metro Manila 3rd District Engineering Office,NCR', 'UPSR', 7790, '3/19/2015', '9/14/2015', '9/12/2015', 100, 14.7369668, 121.0064461, 0, 0),
('NC0215H00085', 'South Super H-way East Service Rd  -  K0013+120 - K0012+575  S03359LZ WIDENING - PAVED', 'DistrictWide,Metro Manila 2nd District Engineering Office,NCR', 'MRRM TRADING & CONSTRUCTION', 'Metro Manila 2nd District Engineering Office,NCR', 'WASR', 18238, '6/9/2015', '11/22/2015', '', 20, 14.5158911, 121.0306735, 0, 0),
('NC0215H00098', 'Local Infrastructure Program - Rehabilitation of Local Roads  Brgy. Tugatog  Malabon City GRAVEL TO PAVED', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'C.B. TAMPENGCO CONSTRUCTION & SUPPLY', 'Malabon-Navotas District Engineering Office,NCR', 'RLIP', 7907, '4/9/2015', '8/7/2015', '8/7/2015', 100, 14.6633985, 120.9647794, 0, 0),
('NC0215H00103', 'Local Infrastructure Program - Construction/Repair/Rehabilitation of Road Network  Santan II HOA  Brgy. Fortune  Marikina City  2nd LD GRAVEL TO PAVED', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'B. VALENCERINA TRADING & CONSTRUCTION', 'Metro Manila 1st District Engineering Office,NCR', 'RLIP', 1000, '4/15/2015', '7/14/2015', '7/16/2015', 100, 14.6582516, 121.1254468, 0, 0),
('NC0215H00121', 'Bangkulasi Br. (B01748LZ) along North Bay Blvd  REPLACEMENT OF DAMAGED  BRIDGE', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'ORANI BUILDERS & SUPPLY', 'Malabon-Navotas District Engineering Office,NCR', 'CNRW', 32847, '10/9/2015', '6/7/2016', '', 5, 14.6506989, 120.9488494, 0, 0),
('NC0215H00136', 'Local Infrastructure Program - Rehabilitation of Local Road of Brgy. Ibaba  Malabon City Lone District GRAVEL TO PAVED', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'AYANA CONSTRUCTION AND TRADING', 'Malabon-Navotas District Engineering Office,NCR', 'RLIP', 3798, '3/27/2015', '8/24/2015', '8/24/2015', 100, 14.6643133, 120.9481698, 0, 0),
('NC0215H00147', 'Local Infrastructure Program -Concreting with drainage improvement  Angeles St.  Barangay Gen. T. De Leon  Valenzuela City 2nd LD    GRAVEL TO PAVED', 'DistrictWide,Metro Manila 3rd District Engineering Office,NCR', 'ST. BERNARDINE CONSTRUCTION & ENTERPRISES (FOR. ST', 'Metro Manila 3rd District Engineering Office,NCR', 'RLIP', 8660, '4/13/2015', '9/9/2015', '9/8/2015', 100, 14.6875696, 120.988638, 0, 0),
('NC0215H00160', 'Local Infrastructure Program - Rehabilitation of Multi-purpose Pavement  Phase 2  Area 4  Block 36  Brgy. NBBS  Navotas City GRAVEL TO PAVED', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'KATHA BUILDERS', 'Malabon-Navotas District Engineering Office,NCR', 'RLIP', 664, '3/10/2015', '4/15/2015', '4/15/2015', 100, 14.6437972, 120.9482503, 0, 0),
('NC0215H00163', 'Local Infrastructure Program - Rehabilitation of Road  Veradero St.  Brgy. Navotas East  Navotas City GRAVEL TO PAVED', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'KATHA BUILDERS', 'Malabon-Navotas District Engineering Office,NCR', 'RLIP', 2183, '3/10/2015', '6/7/2015', '5/29/2015', 100, 14.6556814, 120.9478299, 0, 0),
('NC0215S00003', 'Construction/Repair/Rehabilitation/Improvement of Various Infrastructure including Local Projects - Rehabilitation of School Building at Nueva de Febrero Elementary School  Brgy. Addition Hills  Mandaluyong City Lone District CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'KRBS CONSTRUCTION AND TRADING', 'Metro Manila 1st District Engineering Office,NCR', 'VILP', 1923, '4/15/2015', '5/29/2015', '5/29/2015', 100, 14.5876019, 121.0383506, 0, 0),
('NC0215S00018', 'Construction/Repair/Rehabilitation/Improvement of Various Infrastructure including Local Projects - Rehabilitation of School Building at Mandaluyong High School  Brgy. Poblacion  Mandaluyong City Lone District CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'TRACSOM BUILDERS, INC.', 'Metro Manila 1st District Engineering Office,NCR', 'VILP', 3847, '4/8/2015', '6/7/2015', '5/20/2015', 100, 14.5865445, 121.0245106, 0, 0),
('NC0215S00021', 'Construction/Repair/Rehabilitation/Improvement of Various Infrastructure including Local Projects - Rehabilitation of School Building at Plainview Elementary School  Brgy. Plainview  Mandaluyong City Lone District CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'B. VALENCERINA TRADING & CONSTRUCTION', 'Metro Manila 1st District Engineering Office,NCR', 'VILP', 4746, '3/19/2015', '6/17/2015', '6/17/2015', 100, 14.5756088, 121.0344862, 0, 0),
('NC0215S00035', 'Local Infrastructure Program - Construction of Four (4) Storey Eight (8) Classroom School Building at San Juan National High School  San Juan City Lone District CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'B. BERNARDO CONSTRUCTION', 'Metro Manila 1st District Engineering Office,NCR', 'RLIP', 10709, '9/1/2015', '2/28/2016', '', 16, 14.6056286, 121.028794, 0, 0),
('NC0215S00047', 'Local Infrastructure Program - Construction of 4-storey School Building at Rizal Technological University  Pasig City Campus  Barangay Maybunga  Pasig City Lone District CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'AYLAN CONSTRUCTION & TRADING', 'Metro Manila 1st District Engineering Office,NCR', 'RLIP', 22350, '9/14/2015', '6/3/2016', '', 21, 14.5742497, 121.0411467, 1, 0),
('NC0215S00054', 'Local Infrastructure Program - Construction Multi-Storey Academic Building  Valenzuela Polytechnic College  Valenzuela Campus (Phase 1)  Brgy. Parada  Valenzuela City 1st LD) CONSTRUCTION', 'DistrictWide,Metro Manila 3rd District Engineering Office,NCR', 'GENETIAN BUILDERS', 'Metro Manila 3rd District Engineering Office,NCR', 'RLIP', 15982, '7/16/2015', '2/10/2016', '', 44, 14.6998104, 120.9895386, 0, 0),
('NC0215T00008', 'Local Infrastructure Program - Construction/Rehabilitation of Multi-Purpose Building  Moonwalk E/S  (Golden Acres Annex)   Las Pi?as City Lone District CONSTRUCTION', 'DistrictWide,Las Pi?as-Muntinlupa District Engineering Office,NCR', 'MRJR CONSTRUCTION & TRADING', 'Las Pi?as-Muntinlupa District Engineering Office,NCR', 'RLIP', 2844, '5/8/2015', '7/21/2015', '7/21/2015', 100, 14.4176161, 120.9971843, 0, 0),
('NC0215T00014', 'Local Infrastructure Program - Construction of Multi-Purpose Building  Sto. Ni?o Elementary School  Barangay Sto. Ni?o  Marikina City 1st LD CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'TUCHAR CONSTRUCTION CORP. (FORMERLY:TUCHAR CONSTRU', 'Metro Manila 1st District Engineering Office,NCR', 'RLIP', 7019, '5/15/2015', '10/12/2015', '10/12/2015', 100, 14.6390632, 121.0954542, 0, 0),
('NC0215T00026', 'Local Infrastructure Program - Rehabilitation of Multi-Purpose Building  Brgy. Highway Hills  Mandaluyong City Lone District CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'SPRING STAR CONSTRUCTION & SUPPLY', 'Metro Manila 1st District Engineering Office,NCR', 'RLIP', 3808, '8/27/2015', '11/24/2015', '', 70, 14.5814555, 121.0492615, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`project_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
