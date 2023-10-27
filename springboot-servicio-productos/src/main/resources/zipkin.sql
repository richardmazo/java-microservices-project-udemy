CREATE DATABASE  IF NOT EXISTS `zipkin` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `zipkin`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: zipkin
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `zipkin_annotations`
--

DROP TABLE IF EXISTS `zipkin_annotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zipkin_annotations` (
  `trace_id_high` bigint NOT NULL DEFAULT '0' COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
  `trace_id` bigint NOT NULL COMMENT 'coincides with zipkin_spans.trace_id',
  `span_id` bigint NOT NULL COMMENT 'coincides with zipkin_spans.id',
  `a_key` varchar(255) NOT NULL COMMENT 'BinaryAnnotation.key or Annotation.value if type == -1',
  `a_value` blob COMMENT 'BinaryAnnotation.value(), which must be smaller than 64KB',
  `a_type` int NOT NULL COMMENT 'BinaryAnnotation.type() or -1 if Annotation',
  `a_timestamp` bigint DEFAULT NULL COMMENT 'Used to implement TTL; Annotation.timestamp or zipkin_spans.timestamp',
  `endpoint_ipv4` int DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  `endpoint_ipv6` binary(16) DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null, or no IPv6 address',
  `endpoint_port` smallint DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  `endpoint_service_name` varchar(255) DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  UNIQUE KEY `trace_id_high` (`trace_id_high`,`trace_id`,`span_id`,`a_key`,`a_timestamp`) COMMENT 'Ignore insert on duplicate',
  KEY `trace_id_high_2` (`trace_id_high`,`trace_id`,`span_id`) COMMENT 'for joining with zipkin_spans',
  KEY `trace_id_high_3` (`trace_id_high`,`trace_id`) COMMENT 'for getTraces/ByIds',
  KEY `endpoint_service_name` (`endpoint_service_name`) COMMENT 'for getTraces and getServiceNames',
  KEY `a_type` (`a_type`) COMMENT 'for getTraces and autocomplete values',
  KEY `a_key` (`a_key`) COMMENT 'for getTraces and autocomplete values',
  KEY `trace_id` (`trace_id`,`span_id`,`a_key`) COMMENT 'for dependencies job'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zipkin_annotations`
--

LOCK TABLES `zipkin_annotations` WRITE;
/*!40000 ALTER TABLE `zipkin_annotations` DISABLE KEYS */;
INSERT INTO `zipkin_annotations` VALUES (0,6739335958791044615,-930553760635624935,'sr',NULL,-1,1633837639397791,-1062731451,NULL,NULL,'servicio-usuarios'),(0,6739335958791044615,-930553760635624935,'ss',NULL,-1,1633837640438399,-1062731451,NULL,NULL,'servicio-usuarios'),(0,6739335958791044615,-930553760635624935,'ca',_binary '',0,1633837639397791,-1062731451,NULL,-4177,''),(0,6739335958791044615,-930553760635624935,'http.method',_binary 'GET',6,1633837639397791,-1062731451,NULL,NULL,'servicio-usuarios'),(0,6739335958791044615,-930553760635624935,'http.path',_binary '/usuarios/search/buscar-username',6,1633837639397791,-1062731451,NULL,NULL,'servicio-usuarios'),(0,6739335958791044615,-7920282651408624139,'sr',NULL,-1,1633837640656056,-1062731451,NULL,NULL,'servicio-usuarios'),(0,6739335958791044615,-7920282651408624139,'ss',NULL,-1,1633837640685639,-1062731451,NULL,NULL,'servicio-usuarios'),(0,6739335958791044615,-7920282651408624139,'ca',_binary '',0,1633837640656056,-1062731451,NULL,-4177,''),(0,6739335958791044615,-7920282651408624139,'http.method',_binary 'GET',6,1633837640656056,-1062731451,NULL,NULL,'servicio-usuarios'),(0,6739335958791044615,-7920282651408624139,'http.path',_binary '/usuarios/search/buscar-username',6,1633837640656056,-1062731451,NULL,NULL,'servicio-usuarios'),(0,6739335958791044615,1770530177610365094,'sr',NULL,-1,1633837640700046,-1062731451,NULL,NULL,'servicio-usuarios'),(0,6739335958791044615,1770530177610365094,'ss',NULL,-1,1633837640713075,-1062731451,NULL,NULL,'servicio-usuarios'),(0,6739335958791044615,1770530177610365094,'ca',_binary '',0,1633837640700046,-1062731451,NULL,-4177,''),(0,6739335958791044615,1770530177610365094,'http.method',_binary 'GET',6,1633837640700046,-1062731451,NULL,NULL,'servicio-usuarios'),(0,6739335958791044615,1770530177610365094,'http.path',_binary '/usuarios/search/buscar-username',6,1633837640700046,-1062731451,NULL,NULL,'servicio-usuarios'),(0,6739335958791044615,-930553760635624935,'cs',NULL,-1,1633837638358282,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,-930553760635624935,'cr',NULL,-1,1633837640434721,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,-930553760635624935,'http.method',_binary 'GET',6,1633837638358282,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,-930553760635624935,'http.path',_binary '/usuarios/search/buscar-username',6,1633837638358282,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,-7920282651408624139,'cs',NULL,-1,1633837640650701,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,-7920282651408624139,'cr',NULL,-1,1633837640683471,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,-7920282651408624139,'http.method',_binary 'GET',6,1633837640650701,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,-7920282651408624139,'http.path',_binary '/usuarios/search/buscar-username',6,1633837640650701,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,1770530177610365094,'cs',NULL,-1,1633837640696725,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,1770530177610365094,'cr',NULL,-1,1633837640711639,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,1770530177610365094,'http.method',_binary 'GET',6,1633837640696725,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,1770530177610365094,'http.path',_binary '/usuarios/search/buscar-username',6,1633837640696725,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,-907868328721587381,'sr',NULL,-1,1633837636789863,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,-907868328721587381,'ss',NULL,-1,1633837640936487,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,-907868328721587381,'ca',_binary '',0,1633837636789863,NULL,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,''),(0,6739335958791044615,-907868328721587381,'http.method',_binary 'POST',6,1633837636789863,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,-907868328721587381,'http.path',_binary '/oauth/token',6,1633837636789863,-1062731451,NULL,NULL,'servicio-oauth'),(0,6739335958791044615,-907868328721587381,'cs',NULL,-1,1633837636429746,-1062731451,NULL,NULL,'servicio-zuul-server'),(0,6739335958791044615,-907868328721587381,'cr',NULL,-1,1633837640935075,-1062731451,NULL,NULL,'servicio-zuul-server'),(0,6739335958791044615,-907868328721587381,'http.method',_binary 'POST',6,1633837636429746,-1062731451,NULL,NULL,'servicio-zuul-server'),(0,6739335958791044615,-907868328721587381,'http.path',_binary '/oauth/token',6,1633837636429746,-1062731451,NULL,NULL,'servicio-zuul-server'),(0,6739335958791044615,-907868328721587381,'sa',_binary '',0,1633837636429746,-1062731451,NULL,9100,''),(0,6739335958791044615,6739335958791044615,'sr',NULL,-1,1633837635263830,-1062731451,NULL,NULL,'servicio-zuul-server'),(0,6739335958791044615,6739335958791044615,'ss',NULL,-1,1633837641001444,-1062731451,NULL,NULL,'servicio-zuul-server'),(0,6739335958791044615,6739335958791044615,'ca',_binary '',0,1633837635263830,NULL,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',-4179,''),(0,6739335958791044615,6739335958791044615,'http.method',_binary 'POST',6,1633837635263830,-1062731451,NULL,NULL,'servicio-zuul-server'),(0,6739335958791044615,6739335958791044615,'http.path',_binary '/api/security/oauth/token',6,1633837635263830,-1062731451,NULL,NULL,'servicio-zuul-server');
/*!40000 ALTER TABLE `zipkin_annotations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zipkin_dependencies`
--

DROP TABLE IF EXISTS `zipkin_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zipkin_dependencies` (
  `day` date NOT NULL,
  `parent` varchar(255) NOT NULL,
  `child` varchar(255) NOT NULL,
  `call_count` bigint DEFAULT NULL,
  `error_count` bigint DEFAULT NULL,
  PRIMARY KEY (`day`,`parent`,`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zipkin_dependencies`
--

LOCK TABLES `zipkin_dependencies` WRITE;
/*!40000 ALTER TABLE `zipkin_dependencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `zipkin_dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zipkin_spans`
--

DROP TABLE IF EXISTS `zipkin_spans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zipkin_spans` (
  `trace_id_high` bigint NOT NULL DEFAULT '0' COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
  `trace_id` bigint NOT NULL,
  `id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `remote_service_name` varchar(255) DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `debug` bit(1) DEFAULT NULL,
  `start_ts` bigint DEFAULT NULL COMMENT 'Span.timestamp(): epoch micros used for endTs query and to implement TTL',
  `duration` bigint DEFAULT NULL COMMENT 'Span.duration(): micros used for minDuration and maxDuration query',
  PRIMARY KEY (`trace_id_high`,`trace_id`,`id`),
  KEY `trace_id_high` (`trace_id_high`,`trace_id`) COMMENT 'for getTracesByIds',
  KEY `name` (`name`) COMMENT 'for getTraces and getSpanNames',
  KEY `remote_service_name` (`remote_service_name`) COMMENT 'for getTraces and getRemoteServiceNames',
  KEY `start_ts` (`start_ts`) COMMENT 'for getTraces ordering and range'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zipkin_spans`
--

LOCK TABLES `zipkin_spans` WRITE;
/*!40000 ALTER TABLE `zipkin_spans` DISABLE KEYS */;
INSERT INTO `zipkin_spans` VALUES (0,6739335958791044615,-7920282651408624139,'get','',-907868328721587381,NULL,1633837640650701,32770),(0,6739335958791044615,-930553760635624935,'get','',-907868328721587381,NULL,1633837638358282,2076439),(0,6739335958791044615,-907868328721587381,'post','',6739335958791044615,NULL,1633837636429746,4505329),(0,6739335958791044615,1770530177610365094,'get','',-907868328721587381,NULL,1633837640696725,14914),(0,6739335958791044615,6739335958791044615,'post','',NULL,NULL,1633837635263830,5737614);
/*!40000 ALTER TABLE `zipkin_spans` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-26 19:30:31
