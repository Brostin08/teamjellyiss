-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2015 at 09:45 PM
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
('850f1387921f5c8c50a085d8d19ad2471d77ad0b', '::1', 1448138673, 0x5f5f63695f6c6173745f726567656e65726174657c693a313434383133383433313b);

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
  `project_cost_000` int(10) NOT NULL,
  `date_start` varchar(15) NOT NULL,
  `date_complete_orig` varchar(15) NOT NULL,
  `date_complete_actual` varchar(15) NOT NULL,
  `status_percent` float NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`project_id`, `project_name`, `project_location`, `project_contractor`, `project_office_assigned`, `project_fund_source`, `project_cost_000`, `date_start`, `date_complete_orig`, `date_complete_actual`, `status_percent`, `latitude`, `longitude`) VALUES
('NC0113F00078', 'Construction/Rehabilitation of Drainage Systems along Bonifacio Drive from Anda Circle to Bonifacio Drive Interchange  Port Area Manila CONSTRUCTION', 'Manila District 5,South Manila District Engineering Office,NCR', 'AKH CONSTRUCTION & TRADING CORP.', 'South Manila District Engineering Office,NCR', 'FC LUMPSUM', 12, '9/13/2013', '1/13/2014', '1/13/2014', 100, 14.5908605, 120.9697276),
('NC0113F00097', 'Dredging of Maricaban Creek Retarding Pon  Pasay City OTHERS', 'Pasay City,South Manila District Engineering Office,NCR', 'By Administration', 'South Manila District Engineering Office,NCR', 'DPWH', 3, '7/15/2013', '6/15/2015', '6/15/2015', 100, 14.392988, 121.016121),
('NC0113H00158', 'Concreting and Lane Line Marking along Diokno Boulevard (Buendia Extension to Senate Gate)  Pasay City PAVED (CONCRETE) TO PAVED (CONCRETE)', 'Pasay City,South Manila District Engineering Office,NCR', 'ARMANDO U. KHONG HUN GEN. CONTR., INC.', 'Regional Office,NCR', 'DPWH', 47, '9/17/2013', '1/24/2015', '1/24/2015', 100, 14.4690685, 120.9026387),
('NC0114F00024', 'Flood Control in Manila City 2nd LD - Juan Luna Street  - C 3906.50 to 4598.25 (South Bound) REHABILITATION', 'Manila District 2,North Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'North Manila District Engineering Office,NCR', 'FMSD', 14, '8/11/2014', '3/10/2015', '', 80.25, 14.6161219, 120.968221),
('NC0114F00077', 'Dredging of Estero de Magdalena from Estero dela Reina to Recto DREDGING/DESILTING', 'Manila District 3,North Manila District Engineering Office,NCR', 'ST. GERRARD CONSTRUCTION', 'North Manila District Engineering Office,NCR', 'DDCD', 5, '9/25/2014', '2/17/2015', '2/17/2015', 100, 14.6070174, 120.970295),
('NC0114F00078', 'Estero de San Lazaro (Dredging from Estero dela Reina to Recto DREDGING/DESILTING', 'Manila District 3,North Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'North Manila District Engineering Office,NCR', 'DDCD', 6, '9/25/2014', '3/23/2015', '3/22/2015', 100, 14.6180346, 120.9747854),
('NC0114H00006', 'G Tuazon St - Chainage   0000      -      Chainage   0428 RAISING OF GRADE WITH DRAINAGE IMPROVEMENT', 'Manila District 4,North Manila District Engineering Office,NCR', 'ST. GERRARD CONSTRUCTION', 'North Manila District Engineering Office,NCR', 'UPSR', 16, '9/15/2014', '5/20/2015', '5/11/2015', 100, 14.605672, 120.997701),
('NC0114H00097', 'Local Infrastructure Program - Rehabilitation of Roads - Cavite St.  Brgy. 363  364 and 369  Zone 37  Sta. Cruz  Manila GRAVEL TO PAVED', 'DistrictWide,North Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'North Manila District Engineering Office,NCR', 'RLIP', 6, '9/15/2014', '2/3/2015', '1/31/2015', 100, 14.6235421, 120.9832425),
('NC0114H00132', 'National Road Lighting Program  Roxas Boulevard (Vito Cruz to P. Burgos Stret)    K0002 + (-670) to K000+197 ROAD FACILITIES (WAITING SHED  ETC.)', 'Manila District 5,South Manila District Engineering Office,NCR', 'NEWBIG FOUR J CONSTRUCTION INC., (FORMERLY FOUR J', 'Regional Office,NCR', 'MVUC', 54, '12/5/2014', '8/28/2015', '8/28/2015', 100, 14.5314623, 120.9719198),
('NC0115F00026', 'Construction/Maintenance of Flood Mitigation Structures and Drainage System along Madrid St.  C0 to C170  Manila City 3rd LD CONSTRUCTION', 'DistrictWide,North Manila District Engineering Office,NCR', 'MDAN CONSTRUCTION AND TRADING', 'North Manila District Engineering Office,NCR', 'FMSD', 2, '2/27/2015', '7/11/2015', '5/26/2015', 100, 14.5941764, 120.9704581),
('NC0115F00027', 'Construction of Pumping Station  Retarding Basin and Connecting Drainage - Rehabilitation with Drainage Improvement along S. Reyes St. and x 3rd LD CONSTRUCTION', 'DistrictWide,North Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'North Manila District Engineering Office,NCR', 'FMSD', 7, '2/23/2015', '6/22/2015', '5/29/2015', 100, 14.6052967, 120.9787089),
('NC0115F00052', 'Construction/Maintenance of Flood Mitigation Structures and Drainage System along Luzon St.  Sampaloc  Manila City 4th LD CONSTRUCTION', 'DistrictWide,North Manila District Engineering Office,NCR', 'NORTHERN BUILDERS', 'North Manila District Engineering Office,NCR', 'FMSD', 37, '4/14/2015', '12/6/2015', '', 16, 14.6052967, 120.9787089),
('NC0115F00085', 'Proposed Dredging/Improvement of Existing Retarding Pond  Pasay City CONSTRUCTION', 'Pasay City,South Manila District Engineering Office,NCR', 'E.R. RODRIGUEZ CONSTRUCTION', 'South Manila District Engineering Office,NCR', 'FMSD', 109, '9/1/2015', '8/5/2016', '', 25, 14.5429482, 121.0038303),
('NC0115H00003', 'Local Infrastructure Program - Construction of Brgy. Roads  Brgy 310  Zone 31  Barangays 348 and 349 Zone 35  Sta Cruz  Manila GRAVEL TO PAVED', 'DistrictWide,North Manila District Engineering Office,NCR', 'ST. GERRARD CONSTRUCTION', 'North Manila District Engineering Office,NCR', 'RLIP', 4, '2/23/2015', '5/23/2015', '5/10/2015', 100, 14.6048471, 120.9816278),
('NC0115H00016', 'Quezon Blvd (LZ)  -  K0003+(199) - K0003+639.70 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,North Manila District Engineering Office,NCR', 'RUBY-JADE CONSTRUCTION', 'North Manila District Engineering Office,NCR', 'UPSR', 11, '6/9/2015', '7/8/2015', '', 30, 14.6006321, 120.9822891),
('NC0115H00022', 'Local Infrastructure Program-Improvement of Road and Drainage  Brgy. 829 and vicinity  Pandacan  Manila City 6th LD GRAVEL TO PAVED', 'DistrictWide,South Manila District Engineering Office,NCR', 'MRJR CONSTRUCTION & TRADING', 'South Manila District Engineering Office,NCR', 'RLIP', 2, '6/5/2015', '9/2/2015', '9/2/2015', 100, 14.5888528, 120.9914795),
('NC0115H00039', 'Del Pan Street -  C0 to 221.0 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,North Manila District Engineering Office,NCR', 'ST. GERRARD CONSTRUCTION', 'North Manila District Engineering Office,NCR', 'UPSR', 9, '3/12/2015', '7/9/2015', '7/7/2015', 100, 14.5957714, 120.9653439),
('NC0115H00043', 'Local Infrastructure Program - Road Rehabilitation  Del Pilar St. and Vicinity Singalong  Manila 5th LD PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,South Manila District Engineering Office,NCR', 'R.E. ORLINA CONSTRUCTION CORPORATION', 'South Manila District Engineering Office,NCR', 'RLIP', 3, '4/8/2015', '7/6/2015', '7/5/2015', 100, 14.5703923, 120.9930219),
('NC0115H00048', 'Construction/Repair/Rehabilitation/Improvement of Various Infrastructure including Local Projects - Road and Drainage Improvement  M. Roxas and Delpan Streets via Callejon Streets and vicinity  Sta. Ana  Manila City 6th LD PAVED (CONCRETE) TO PAVED (', 'DistrictWide,South Manila District Engineering Office,NCR', 'MPJR BUILDERS COMPANY', 'South Manila District Engineering Office,NCR', 'VILP', 10, '4/30/2015', '11/26/2015', '', 92, 14.5957714, 120.9653439),
('NC0115H00050', 'Construction/Repair/Rehabilitation/Improvement of Various Infrastructure including Local Projects - Road and Drainage Improvement  F. Calderon Street to Tejeron Street via Suter Street and vicinity  Sta. Ana  Manila City 6th LD PAVED (CONCRETE) TO PA', 'DistrictWide,South Manila District Engineering Office,NCR', 'SPRING STAR CONSTRUCTION & SUPPLY', 'South Manila District Engineering Office,NCR', 'VILP', 12, '5/29/2015', '11/24/2015', '', 90, 14.5808566, 121.0112473),
('NC0115H00051', 'Local Infrastructure Program-Improvement of Road and Drainage  Zone 98 and vicinity  Sta. Ana  and Brgy. 866 and vicinity  Pandacan Manila City 6th LD GRAVEL TO PAVED', 'DistrictWide,North Manila District Engineering Office,NCR', 'FRAMECON BUILDERS', 'North Manila District Engineering Office,NCR', 'RLIP', 3, '5/7/2015', '8/4/2015', '9/2/2015', 100, 14.5833498, 121.002667),
('NC0115H00069', 'National Road Lighting Program (NRLP) Package 8 (Civil Works)  Roxas Boulevard Completion  Roxas Boulevard East Service Road S03341LZ: CO to C479 with exceptions  S03251LZ: K0005+(-239) to K0003+300 with exceptions  S02896LZ: CO to C2453 with excepti', 'DistrictWide,South Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'South Manila District Engineering Office,NCR', 'MVUC', 46, '9/4/2015', '3/1/2016', '', 33, 14.5514337, 120.987575),
('NC0115S00002', 'Local Infrastructure Program - Construction of School Building  Raja Soliman High School  Manila City 3rd LD   CONSTRUCTION', 'DistrictWide,North Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'North Manila District Engineering Office,NCR', 'RLIP', 18, '6/9/2015', '11/5/2015', '', 85, 14.5977486, 120.9704756),
('NC0115S00003', 'Local Infrastructure Program - Construction of School Building  Raja Soliman High School  Manila 3rd LD CONSTRUCTION', 'DistrictWide,North Manila District Engineering Office,NCR', 'FLORDES CONSTRUCTION & TRADING CORP. (FORMERLY FLO', 'North Manila District Engineering Office,NCR', 'RLIP', 18, '6/23/2015', '11/19/2015', '', 5, 14.5977486, 120.9704756),
('NC0115T00005', 'Local Infrastructure Program - Completion/Improvement/Construction of Multi-Purpose Buildings: Sta. Mesa   Zone 59; Pandacan  Brgy. 849 Zone 93; Punta  Sta. Ana  Zone 100  and San Miguel  Brgy. 642  Zone 66   Manila City 6th LD CONSTRUCTION', 'DistrictWide,South Manila District Engineering Office,NCR', 'AYANA CONSTRUCTION AND TRADING', 'South Manila District Engineering Office,NCR', 'RLIP', 1, '9/4/2015', '11/2/2015', '', 40, 14.6011162, 121.0153113),
('NC0115T00016', 'Local Infrastructure Program - Construction of Multi-Purpose Building  Brgy. 147 and Brgy. 42  Pasay City Lone District CONSTRUCTION', 'DistrictWide,South Manila District Engineering Office,NCR', 'KPGONZALES CONSTRUCTION SUPPLY AND TRADING', 'South Manila District Engineering Office,NCR', 'RLIP', 3, '9/17/2015', '2/13/2016', '', 39.2, 14.5605264, 120.995653),
('NC0115T00026', 'Local Infrastructure Program - Construction of Multi-Purpose Buildings (Covered Court)  Barangay 104  Zone 8 Lallana/J.P. Rizal St. Tondo  Manila City 1st LD CONSTRUCTION', 'DistrictWide,North Manila District Engineering Office,NCR', 'BLACKRAM BUILDERS, INC.', 'North Manila District Engineering Office,NCR', 'RLIP', 980, '7/3/2015', '8/31/2015', '8/31/2015', 100, 14.6168157, 120.9447847),
('NC0115T00036', 'Const/Repair/Rehab/Impvt of Various Infrastructure including Local Projects -  Construction of Multi-purpose Building  Barangay 873 Zone 96  Sta. Ana  Brgy. 894 and 896 Zone 99  Punta and Beata Elementary School  Pandacan  Manila City 6th LD CONSTRUC', 'DistrictWide,North Manila District Engineering Office,NCR', 'LE BRON CONSTRUCTION', 'North Manila District Engineering Office,NCR', 'VILP', 4, '9/9/2015', '3/6/2016', '', 15, 14.5798792, 121.009968),
('NC0115T00049', 'Local Infrastructure Program - Construction of Multi-Purpose Building  Pasay City Cemetery Lone District CONSTRUCTION', 'Pasay City,South Manila District Engineering Office,NCR', 'VIVID CONSTRUCTION INC.(FORMERLY VIVID CONSTRUCTIO', 'South Manila District Engineering Office,NCR', 'RLIP', 3, '4/30/2015', '9/24/2015', '9/24/2015', 100, 14.580165, 121.012503),
('NC0115T00056', 'Local Infrastructure Program - Construction of Multi-Purpose Building  Barangay 149  Barangay 150  Zone 13 (Marco) Manila City 2nd LD CONSTRUCTION', 'Manila District 2,North Manila District Engineering Office,NCR', 'HOUSEROCK BUILDERS & TRADING', 'North Manila District Engineering Office,NCR', 'RLIP', 6, '3/27/2015', '10/25/2015', '10/25/2015', 100, 14.6212892, 120.9687424),
('NC0210H00309', 'Construction of C-5 Extension Project (SLEX/West Service Road to Multinational Avenue)  Cities of Pasay and Para?aque GRAVEL TO PAVED', 'DistrictWide,Metro Manila 2nd District Engineering Office,NCR', 'NEWINGTON BUILDERS, INC.(FOR: E. GARDIOLA CONSTRUC', 'Regional Office,NCR', 'DPWH', 116, '12/27/2011', '9/6/2012', '', 60.201, 14.4658526, 121.0275719),
('NC0213H00442', 'Rehabilitation?reconstruction/Stregthening of Bridge. Sucat Interchange East and West Bound along MSDR East Service Road  Brgy Sucat  Muntinlupa City RETROFITTING/REHABILITATION/STRENGTHENING', 'Muntinlupa City,Las Pi?as-Muntinlupa District Engineering Office,NCR', 'L.R. TIQUI BUILDERS, INC.', 'Las Pi?as-Muntinlupa District Engineering Office,NCR', 'SAVE', 16, '4/10/2014', '12/28/2014', '', 78, 14.4542915, 121.0405786),
('NC0214F00055', 'Construction/Rehabilitation of Flood Control in Para?aque City 1st LD - Upgrading / Box Culvert along Villanueva Creek  Schillings Lane (Villanueva Village)  Brgy. San Dionisio CONSTRUCTION', 'Para?aque City I,Metro Manila 2nd District Engineering Office,NCR', 'N.C. AGUILAR CONST. & SUPPLY INC.', 'Metro Manila 2nd District Engineering Office,NCR', 'FMSD', 6, '9/8/2014', '4/14/2015', '4/14/2015', 100, 14.475764, 121.001345),
('NC0214F00137', 'Construction of box culvert and rehabilitation of Rogan Creek  Brgy. Maharlika  Taguig City CONSTRUCTION', 'Taguig City,Metro Manila 1st District Engineering Office,NCR', 'HONEYVILLE CONSTRUCTION', 'Metro Manila 1st District Engineering Office,NCR', 'FMSD', 17, '9/3/2014', '3/1/2015', '', 11, 14.4961424, 121.0542005),
('NC0214F00141', 'Valenzuela-Obando-Meycauayan Flood Control Project  Valenzuela - Improvement of earthdike along the left bank of Polo River  Valenzuela City OTHERS', 'Valenzuela City I,Metro Manila 3rd District Engineering Office,NCR', 'E.R. RODRIGUEZ CONSTRUCTION', 'Metro Manila 3rd District Engineering Office,NCR', 'FMSD', 50, '9/7/2014', '6/25/2015', '6/25/2015', 100, 14.6795702, 120.9599228),
('NC0214F00151', 'Improvement/Rehabilitation of Slope Proteection of Naga Creek  Las Pi?as City REHABILITATION', 'Las Pi?as City,Las Pi?as-Muntinlupa District Engineering Office,NCR', 'LMG CONSTRUCTION', 'Las Pi?as-Muntinlupa District Engineering Office,NCR', 'FMSD', 5, '11/6/2014', '3/4/2015', '3/4/2015', 100, 14.4689596, 120.9778127),
('NC0214F00167', 'Improvement/Upgrading of drainage System  along Daang Maharlika Road in front of Makati Foundry  Madaong Creek  Brgy. Tunasan REHABILITATION', 'Muntinlupa City,Las Pi?as-Muntinlupa District Engineering Office,NCR', 'MRRM TRADING & CONSTRUCTION', 'Las Pi?as-Muntinlupa District Engineering Office,NCR', 'FMSD', 1, '12/28/2014', '2/10/2015', '2/10/2015', 100, 14.3682374, 121.015131),
('NC0214H00020', 'Gen San Miguel St - K0011  +  (-662)      -      K0011  +  028 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'Caloocan City II,Metro Manila 3rd District Engineering Office,NCR', 'NEWBIG FOUR J CONSTRUCTION INC., (FORMERLY FOUR J', 'Metro Manila 3rd District Engineering Office,NCR', 'UPSR', 21, '2/3/2014', '6/30/2015', '6/25/2015', 100, 14.6583527, 120.9670083),
('NC0214H00212', 'Construction/Improvement/Widening/Rehabilitation of NAIA Expressway and Other Major Roads in Metro Manila  Including ROW > Improvement/Rehabilitation of San Juan-Santolan Road (Paltok Section) including Right-of-Way  San Juan City WIDENING - PAVED', 'San Juan,Metro Manila 1st District Engineering Office,NCR', '6RM CONSTRUCTION AND DEVT. CORP. (FORMERLY R.R. MA', 'Metro Manila 1st District Engineering Office,NCR', 'WANR', 1, '11/19/2014', '8/20/2015', '8/20/2015', 100, 14.5274867, 121.0049091),
('NC0215H00067', 'Construction of Taguig Diversion Road to Pateros By-Pass Road  Brgy. Sta. Ana & Brgy. San Roque  Pateros  M.M.   Taguig City-Pateros 1st LD GRAVEL TO PAVED', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'DAHL CONSTRUCTION', 'Metro Manila 1st District Engineering Office,NCR', 'CBPR', 10, '5/8/2015', '11/4/2015', '', 98, 14.5431172, 121.0675244),
('NC0215H00070', 'Gov A Pascual St  -  K0012+(-570) - K0012+(-410)  K0012+(-310) - K0012+585 CONCRETE REBLOCKING RIGHT LANE', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'KATHA BUILDERS', 'Malabon-Navotas District Engineering Office,NCR', 'SBSR', 2, '5/5/2015', '6/10/2015', '6/10/2015', 100, 14.6679249, 120.9626781),
('NC0215H00072', 'MacArthur H-way -  K0011+-297 - K0011+003 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,Metro Manila 3rd District Engineering Office,NCR', 'E.L. TORRES CONSTRUCTION AND TRADING', 'Metro Manila 3rd District Engineering Office,NCR', 'UPAR', 15, '3/17/2015', '9/12/2015', '9/12/2015', 100, 14.69276, 120.9666543),
('NC0215H00075', 'C Arellano St  -  K0012+-698 - K 0011+247 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'C.B. TAMPENGCO CONSTRUCTION & SUPPLY', 'Malabon-Navotas District Engineering Office,NCR', 'UPSR', 8, '5/5/2015', '10/2/2015', '10/2/2015', 100, 14.6658959, 120.9468622),
('NC0215H00076', 'C-4 Road  -  K0013+(-092) - K0013+000  K0013+090 - K0013+108 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'STRUKTURA TEKNIKA SERVICES CO.', 'Malabon-Navotas District Engineering Office,NCR', 'UPSR', 4, '5/4/2015', '7/3/2015', '7/3/2015', 100, 14.6554027, 120.9548527),
('NC0215H00081', 'Canumay-Bignay Road  -  Chainage 2034 - Chainage 2937 PAVED (CONCRETE) TO PAVED (CONCRETE)', 'DistrictWide,Metro Manila 3rd District Engineering Office,NCR', 'LARSEN-DUTCHER CONSTRACTOR', 'Metro Manila 3rd District Engineering Office,NCR', 'UPSR', 7, '3/19/2015', '9/14/2015', '9/12/2015', 100, 14.7369668, 121.0064461),
('NC0215H00085', 'South Super H-way East Service Rd  -  K0013+120 - K0012+575  S03359LZ WIDENING - PAVED', 'DistrictWide,Metro Manila 2nd District Engineering Office,NCR', 'MRRM TRADING & CONSTRUCTION', 'Metro Manila 2nd District Engineering Office,NCR', 'WASR', 18, '6/9/2015', '11/22/2015', '', 20, 14.5158911, 121.0306735),
('NC0215H00098', 'Local Infrastructure Program - Rehabilitation of Local Roads  Brgy. Tugatog  Malabon City GRAVEL TO PAVED', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'C.B. TAMPENGCO CONSTRUCTION & SUPPLY', 'Malabon-Navotas District Engineering Office,NCR', 'RLIP', 7, '4/9/2015', '8/7/2015', '8/7/2015', 100, 14.6633985, 120.9647794),
('NC0215H00103', 'Local Infrastructure Program - Construction/Repair/Rehabilitation of Road Network  Santan II HOA  Brgy. Fortune  Marikina City  2nd LD GRAVEL TO PAVED', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'B. VALENCERINA TRADING & CONSTRUCTION', 'Metro Manila 1st District Engineering Office,NCR', 'RLIP', 1, '4/15/2015', '7/14/2015', '7/16/2015', 100, 14.6582516, 121.1254468),
('NC0215H00121', 'Bangkulasi Br. (B01748LZ) along North Bay Blvd  REPLACEMENT OF DAMAGED  BRIDGE', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'ORANI BUILDERS & SUPPLY', 'Malabon-Navotas District Engineering Office,NCR', 'CNRW', 32, '10/9/2015', '6/7/2016', '', 5, 14.6506989, 120.9488494),
('NC0215H00136', 'Local Infrastructure Program - Rehabilitation of Local Road of Brgy. Ibaba  Malabon City Lone District GRAVEL TO PAVED', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'AYANA CONSTRUCTION AND TRADING', 'Malabon-Navotas District Engineering Office,NCR', 'RLIP', 3, '3/27/2015', '8/24/2015', '8/24/2015', 100, 14.6643133, 120.9481698),
('NC0215H00147', 'Local Infrastructure Program -Concreting with drainage improvement  Angeles St.  Barangay Gen. T. De Leon  Valenzuela City 2nd LD    GRAVEL TO PAVED', 'DistrictWide,Metro Manila 3rd District Engineering Office,NCR', 'ST. BERNARDINE CONSTRUCTION & ENTERPRISES (FOR. ST', 'Metro Manila 3rd District Engineering Office,NCR', 'RLIP', 8, '4/13/2015', '9/9/2015', '9/8/2015', 100, 14.6875696, 120.988638),
('NC0215H00160', 'Local Infrastructure Program - Rehabilitation of Multi-purpose Pavement  Phase 2  Area 4  Block 36  Brgy. NBBS  Navotas City GRAVEL TO PAVED', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'KATHA BUILDERS', 'Malabon-Navotas District Engineering Office,NCR', 'RLIP', 664, '3/10/2015', '4/15/2015', '4/15/2015', 100, 14.6437972, 120.9482503),
('NC0215H00163', 'Local Infrastructure Program - Rehabilitation of Road  Veradero St.  Brgy. Navotas East  Navotas City GRAVEL TO PAVED', 'DistrictWide,Malabon-Navotas District Engineering Office,NCR', 'KATHA BUILDERS', 'Malabon-Navotas District Engineering Office,NCR', 'RLIP', 2, '3/10/2015', '6/7/2015', '5/29/2015', 100, 14.6556814, 120.9478299),
('NC0215S00003', 'Construction/Repair/Rehabilitation/Improvement of Various Infrastructure including Local Projects - Rehabilitation of School Building at Nueva de Febrero Elementary School  Brgy. Addition Hills  Mandaluyong City Lone District CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'KRBS CONSTRUCTION AND TRADING', 'Metro Manila 1st District Engineering Office,NCR', 'VILP', 1, '4/15/2015', '5/29/2015', '5/29/2015', 100, 14.5876019, 121.0383506),
('NC0215S00018', 'Construction/Repair/Rehabilitation/Improvement of Various Infrastructure including Local Projects - Rehabilitation of School Building at Mandaluyong High School  Brgy. Poblacion  Mandaluyong City Lone District CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'TRACSOM BUILDERS, INC.', 'Metro Manila 1st District Engineering Office,NCR', 'VILP', 3, '4/8/2015', '6/7/2015', '5/20/2015', 100, 14.5865445, 121.0245106),
('NC0215S00021', 'Construction/Repair/Rehabilitation/Improvement of Various Infrastructure including Local Projects - Rehabilitation of School Building at Plainview Elementary School  Brgy. Plainview  Mandaluyong City Lone District CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'B. VALENCERINA TRADING & CONSTRUCTION', 'Metro Manila 1st District Engineering Office,NCR', 'VILP', 4, '3/19/2015', '6/17/2015', '6/17/2015', 100, 14.5756088, 121.0344862),
('NC0215S00035', 'Local Infrastructure Program - Construction of Four (4) Storey Eight (8) Classroom School Building at San Juan National High School  San Juan City Lone District CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'B. BERNARDO CONSTRUCTION', 'Metro Manila 1st District Engineering Office,NCR', 'RLIP', 10, '9/1/2015', '2/28/2016', '', 16, 14.6056286, 121.028794),
('NC0215S00047', 'Local Infrastructure Program - Construction of 4-storey School Building at Rizal Technological University  Pasig City Campus  Barangay Maybunga  Pasig City Lone District CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'AYLAN CONSTRUCTION & TRADING', 'Metro Manila 1st District Engineering Office,NCR', 'RLIP', 22, '9/14/2015', '6/3/2016', '', 21, 14.5742497, 121.0411467),
('NC0215S00054', 'Local Infrastructure Program - Construction Multi-Storey Academic Building  Valenzuela Polytechnic College  Valenzuela Campus (Phase 1)  Brgy. Parada  Valenzuela City 1st LD) CONSTRUCTION', 'DistrictWide,Metro Manila 3rd District Engineering Office,NCR', 'GENETIAN BUILDERS', 'Metro Manila 3rd District Engineering Office,NCR', 'RLIP', 15, '7/16/2015', '2/10/2016', '', 44, 14.6998104, 120.9895386),
('NC0215T00008', 'Local Infrastructure Program - Construction/Rehabilitation of Multi-Purpose Building  Moonwalk E/S  (Golden Acres Annex)   Las Pi?as City Lone District CONSTRUCTION', 'DistrictWide,Las Pi?as-Muntinlupa District Engineering Office,NCR', 'MRJR CONSTRUCTION & TRADING', 'Las Pi?as-Muntinlupa District Engineering Office,NCR', 'RLIP', 2, '5/8/2015', '7/21/2015', '7/21/2015', 100, 14.4176161, 120.9971843),
('NC0215T00014', 'Local Infrastructure Program - Construction of Multi-Purpose Building  Sto. Ni?o Elementary School  Barangay Sto. Ni?o  Marikina City 1st LD CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'TUCHAR CONSTRUCTION CORP. (FORMERLY:TUCHAR CONSTRU', 'Metro Manila 1st District Engineering Office,NCR', 'RLIP', 7, '5/15/2015', '10/12/2015', '10/12/2015', 100, 14.6390632, 121.0954542),
('NC0215T00026', 'Local Infrastructure Program - Rehabilitation of Multi-Purpose Building  Brgy. Highway Hills  Mandaluyong City Lone District CONSTRUCTION', 'DistrictWide,Metro Manila 1st District Engineering Office,NCR', 'SPRING STAR CONSTRUCTION & SUPPLY', 'Metro Manila 1st District Engineering Office,NCR', 'RLIP', 3, '8/27/2015', '11/24/2015', '', 70, 14.5814555, 121.0492615);

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
