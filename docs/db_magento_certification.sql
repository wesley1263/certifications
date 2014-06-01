-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 01-Jun-2014 às 12:33
-- Versão do servidor: 5.5.37-0ubuntu0.14.04.1
-- versão do PHP: 5.5.9-1ubuntu4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `db_magento_certification`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_alternative`
--

CREATE TABLE IF NOT EXISTS `tbl_alternative` (
  `id_alternative` int(11) NOT NULL AUTO_INCREMENT,
  `id_questions` int(11) NOT NULL,
  `option_alternative` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `description_alternative` text COLLATE utf8_unicode_ci NOT NULL,
  `form_alternative` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `status_alternative` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_alternative`),
  KEY `fk_alternative_question` (`id_questions`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=249 ;

--
-- Extraindo dados da tabela `tbl_alternative`
--

INSERT INTO `tbl_alternative` (`id_alternative`, `id_questions`, `option_alternative`, `description_alternative`, `form_alternative`, `status_alternative`) VALUES
(1, 1, 'A', 'The eav_attribute table must contain a row defining the attribute''s properties and its entity type.', 'checkbox', 1),
(2, 1, 'B', 'The attribute must have a backend model configured in the XML config.', 'checkbox', 1),
(3, 1, 'C', 'The attribute must be part of the attribute set pertaining to the object being loaded.', 'checkbox', 1),
(4, 1, 'D', 'There must be a record of the attribute on the catalog_product_super_attribute table.', 'checkbox', 1),
(5, 1, 'E', 'There must be a column added to the catalog_product_entitytable.', 'checkbox', 1),
(14, 2, 'A', 'Mage_Adminhtml_Block_Widget\r\n', 'radio', 1),
(15, 2, 'B', 'Varien_Data_Grid\r\n', 'radio', 1),
(16, 2, 'C', 'Varien_Data_Widge \r\n', 'radio', 1),
(17, 2, 'D', 'Mage_Adminhtml_Block_Template', 'radio', 1),
(18, 3, 'A', '$collection->addAttributeToFilter(array(\r\narray(''attribute''=>''price'',''eq''=>0.00),\r\narray(''attribute''=>''name'',''like''=>''Test%'')\r\n));\r\n', 'radio', 1),
(19, 3, 'B', '$collection\r\n->addFieldToFilter(''price'',0.00)\r\n->addFieldToFilter(''name'',array(''like''=>''Test%''));\r\n', 'radio', 1),
(20, 3, 'C', '$collection\r\n->addAttributeToFilter(''price'',0.00)\r\n->addAttributeToFilter(''name'',array(''like''=>''Test%''));\r\n', 'radio', 1),
(21, 3, 'D', '$collection->addFieldToFilter(\r\narray(''price''=>''name''),\r\narray(array(''eq''=>0.00),array(''like'' => ''Test%'')));\r\n', 'radio', 1),
(22, 3, 'E', '$collection\r\n->addAttributeToFilter( ''price''=>''name'')\r\n->addOrCondition(''name'',array(''like''=>''Test%'')));', 'radio', 1),
(27, 4, 'A', ' You have defined an ACL in your module configuration\r\n', 'checkbox', 1),
(28, 4, 'B', ' At least one admin role must have permission for that route\r\n', 'checkbox', 1),
(29, 4, 'C', ' You have extended the controller from Mage_Adminhtml_Controller_Action\r\n', 'checkbox', 1),
(30, 4, 'D', ' You have defined a method _isAllowed which checks the permission\r\n', 'checkbox', 1),
(31, 4, 'E', ' The route name must start with admin', 'checkbox', 1),
(32, 5, 'A', ' sales_flat_order_increment\r\n', 'radio', 1),
(33, 5, 'B', ' eav_entity_store\r\n', 'radio', 1),
(34, 5, 'C', ' core_increment\r\n', 'radio', 1),
(35, 5, 'D', ' core_config_data', 'radio', 1),
(36, 6, 'A', ' catalog_category.save\r\n', 'radio', 1),
(37, 6, 'B', ' catalog_product.items\r\n', 'radio', 1),
(38, 6, 'C', ' catalog_product_attribute_set.update\r\n', 'radio', 1),
(39, 6, 'D', ' catalog_product.info', 'radio', 1),
(40, 7, 'A', ' Mage_Eav_Model_Indexer_Abstract\r\n', 'radio', 1),
(41, 7, 'B', ' Mage_Core_Model_lndexer_Abstract\r\n', 'radio', 1),
(42, 7, 'C', ' Mage_Index_Model_Entity_Indexer_Abstract\r\n', 'radio', 1),
(43, 7, 'D', ' Mage_Index_Model_Indexer_Abstract', 'radio', 1),
(44, 8, 'A', ' text\r\n', 'checkbox', 1),
(45, 8, 'B', ' textarea\r\n', 'checkbox', 1),
(46, 8, 'C', ' select\r\n', 'checkbox', 1),
(47, 8, 'D', ' multiselect\r\n', 'checkbox', 1),
(48, 8, 'E', ' date\r\n', 'checkbox', 1),
(49, 8, 'F', ' gallery', 'checkbox', 1),
(50, 9, 'A', ' No difference: pay () will always call capture( ).\r\n', 'radio', 1),
(51, 9, 'B', ' pay( )will trigger the payment and capture( )will not.\r\n', 'radio', 1),
(52, 9, 'C', ' capture( )will trigger the payment and pay( )will not.\r\n', 'radio', 1),
(53, 9, 'D', ' The difference is determined by the payment method implementation.', 'radio', 1),
(54, 10, 'A', ' The sort order is specified in the admin configuration under Sales > "Checkout Totals Sort\r\nOrder".\r\n', 'radio', 1),
(55, 10, 'B', ' The sort order is specified in the system configuration under\r\nglobal/sales/quote/totals/ [total_code] with <before> and <after> nodes.\r\n', 'radio', 1),
(56, 10, 'C', ' The sort order is defined by the module loading order as specified by the children of the\r\nmodules/ [module_name]/depends configuration node.\r\n', 'radio', 1),
(57, 10, 'D', ' The sort order is specified by the collect method in each total model.', 'radio', 1),
(58, 11, 'A', ' collectShippingRates( )\r\n', 'radio', 1),
(59, 11, 'B', ' getAllowedMethods( )\r\n', 'radio', 1),
(60, 11, 'C', ' getShippingRates( )\r\n', 'radio', 1),
(61, 11, 'D', ' getAvailableRates( )\r\n', 'radio', 1),
(62, 11, 'E', ' collectRates( )', 'radio', 1),
(63, 12, 'A', ' varchar\r\n', 'radio', 1),
(64, 12, 'B', ' enum\r\n', 'radio', 1),
(65, 12, 'C', ' option\r\n', 'radio', 1),
(66, 12, 'D', ' union', 'radio', 1),
(67, 13, 'A', '<frontend>\r\n  <routers>\r\n    <cms>\r\n     <args>\r\n       <modules>\r\n        <achm_cms_before="Mage_Cms">Achme_Cms</achme_cms>\r\n       </modulea>\r\n      </args>\r\n    </cms>\r\n  </routers>\r\n</frontend>\r\n', 'radio', 1),
(68, 13, 'B', '<text> \r\n<frontend>\r\n  <routers>\r\n    <achm_cms>\r\n      <args>\r\n        <modules>\r\n         <cms before="Mage_Cms">Achme_Cms</cms>\r\n        </modulea>\r\n      </args>\r\n    </achm_cms>\r\n  </routers>\r\n</frontend>\r\n</text>', 'radio', 1),
(69, 13, 'C', ' <frontend>\r\n  <routers>\r\n    <cms>\r\n      <args>\r\n        <rewrite>\r\n         <mage_cms>Achme_Cms</mage_cms>\r\n        </rewrite>\r\n      </args>\r\n    </cms>\r\n  </routers>\r\n</frontend>\r\n', 'radio', 1),
(70, 13, 'D', '<global>\r\n   <controllers>\r\n     <achme_cms>\r\n       <rewrite>\r\n         <mage_cms>Achme_Cms</mage_cms>\r\n       </rewrite>\r\n     </achme_cms>\r\n   </controllers>\r\n </global>', 'radio', 1),
(71, 15, 'A', ' taken from the catalog_product_index_price table\r\n', 'radio', 1),
(72, 15, 'B', ' taken from the catalog_product_index_price_idx table\r\n', 'radio', 1),
(73, 15, 'C', ' taken from the catalog_product_index_price_f inal_idx table\r\n', 'radio', 1),
(74, 15, 'D', ' calculated on-the-fly on php-level\r\n', 'radio', 1),
(75, 15, 'E', ' pre-calculated in the products price attribute', 'radio', 1),
(76, 16, 'A', ' A data helper is used in order to properly load an object''s attributes from the database.\r\n', 'radio', 1),
(77, 16, 'B', ' EAV-based data models use a different abstract resource class than other data models.\r\n', 'radio', 1),
(78, 16, 'C', ' The attribute values are loaded into an attribute collection object.\r\n', 'radio', 1),
(79, 16, 'D', ' You must always specify each of the attributes to be loaded on the model.', 'radio', 1),
(80, 17, 'A', 'Order\r\n', 'radio', 1),
(81, 17, 'B', ' Payment\r\n', 'radio', 1),
(82, 17, 'C', ' Invoice\r\n', 'radio', 1),
(83, 17, 'D', ' payment_method', 'radio', 1),
(84, 18, 'A', ' base_price and price properties with the discounted price\r\n', 'radio', 1),
(85, 18, 'B', ' base_discount_amount and discount_amount with the discount applied to the original price\r\n', 'radio', 1),
(86, 18, 'C', ' base_row_total and row_total properties with the discounted price\r\n', 'radio', 1),
(87, 18, 'D', ' base_price_incl_tax and price_incl_tax properties with the discounted price', 'radio', 1),
(88, 19, 'A', ' Mage_Core_Block_Text_List declares its own template for rendering, but the rendered\r\ntemplate can be overridden via layout XML.\r\n', 'radio', 1),
(89, 19, 'B', ' Child blocks of Mage_Core_Block_Text_List are always rendered alphabetically by name.\r\n', 'radio', 1),
(90, 19, 'C', ' Mage_Core_Block_Text_List will always render all children automatically when it is rendered.\r\n', 'radio', 1),
(91, 19, 'D', ' Mage_Core_Block_Text_List directly extends Mage_Core_Block_Template\r\n', 'radio', 1),
(92, 19, 'E', ' In order to render, the parent block of Mage_Core_Block_Text_List must always be an output\r\nblock.', 'radio', 1),
(93, 20, 'A', ' XmlRpc\r\n', 'radio', 1),
(94, 20, 'B', ' REST\r\n', 'radio', 1),
(95, 20, 'C', ' POST\r\n', 'radio', 1),
(96, 20, 'D', ' Open Social\r\n', 'radio', 1),
(97, 20, 'E', ' XQuery', 'radio', 1),
(98, 22, 'A', ' Mage_Checkout_Model_Cart\r\n', 'radio', 1),
(99, 22, 'B', ' Mage_Sales_Model_Quote\r\n', 'radio', 1),
(100, 22, 'C', ' Mage_Sales_Model_Quote_Address<type=shipping>\r\n', 'radio', 1),
(101, 22, 'D', ' Mage_Sales_Model_Quote_Address<type=billing>', 'radio', 1),
(102, 23, 'A', ' An entity table for storing the entities'' basic information\r\n', 'radio', 1),
(103, 23, 'B', ' One or more tables to store the entities'' associated pieces of information\r\n', 'radio', 1),
(104, 23, 'C', ' A two-column cross-link table to associate attribute values with a corresponding entity\r\n', 'radio', 1),
(105, 23, 'D', ' Foreign keys on each relevant table to connect relevant pieces of information at the database\r\nlevel\r\n', 'radio', 1),
(106, 23, 'E', ' An attribute table that defines what data (and of what type) may be stored on a particular entity', 'radio', 1),
(107, 24, 'A', ' backend_model\r\n', 'checkbox', 1),
(108, 24, 'B', ' admin_model\r\n', 'checkbox', 1),
(109, 24, 'C', ' frontend_model\r\n', 'checkbox', 1),
(110, 24, 'D', ' source_model\r\n', 'checkbox', 1),
(111, 24, 'E', ' source_type\r\n', 'checkbox', 1),
(112, 24, 'F', ' show_in_store', 'checkbox', 1),
(113, 25, 'A', ' partial void\r\n', 'checkbox', 1),
(114, 25, 'B', ' partial invoice\r\n', 'checkbox', 1),
(115, 25, 'C', ' partial capture\r\n', 'checkbox', 1),
(116, 25, 'D', ' partial refund\r\n', 'checkbox', 1),
(117, 25, 'E', ' partial shipment', 'checkbox', 1),
(118, 26, 'A', ' catalog_product_link.list, with arguments $type=''related'', $product_id\r\n', 'radio', 1),
(119, 26, 'B', ' catalog_product.list, with arguments $type=''related'', $product_id\r\n', 'radio', 1),
(120, 26, 'C', ' catalog_product_related.list, with argument $product_id\r\n', 'radio', 1),
(121, 26, 'D', ' catalog_product_option.list, with arguments $type='' related'', $product_id', 'radio', 1),
(122, 28, 'A', ' catalog/rewrite/product/view\r\n', 'radio', 1),
(123, 28, 'B', ' catalog_product/rewrite/view\r\n', 'radio', 1),
(124, 28, 'C', ' catalog/product/rewrite/view\r\n', 'radio', 1),
(125, 28, 'D', ' catalog/product_view/rewrite\r\n', 'radio', 1),
(126, 28, 'E', ' catalog/rewrite/product_view\r\n', 'radio', 1),
(127, 28, 'F', ' catalog_product_view/rewrite', 'radio', 1),
(128, 29, 'A', 'State and status are independent properties of the order.\r\n', 'radio', 1),
(129, 29, 'B', ' The status is a child of the state.\r\n', 'radio', 1),
(130, 29, 'C', ' State represents the general state of the order, while status works on item level.\r\n', 'radio', 1),
(131, 29, 'D', ' An order doesn''t have a status, only a state. Status is a property of an invoice, shipment, and\r\ncredit memo.', 'radio', 1),
(132, 30, 'A', ' $quoteItem->getFreeShipping( )== true\r\n', 'checkbox', 1),
(133, 30, 'B', ' $quoteItem->getProduct( )->isVirtual( )== true\r\n', 'checkbox', 1),
(134, 30, 'C', ' $quoteItem->getweight( )> 0\r\n', 'checkbox', 1),
(135, 30, 'D', ' $quoteItem->isShipSeparately( )&& SquoteItem->getHasChildren( )\r\n', 'checkbox', 1),
(136, 30, 'E', ' $quoteItem( )->getQty( )<\r\nMage::getStoreConfig(''''carriers/tablerate/min_shipping_qty'''')', 'checkbox', 1),
(137, 31, 'A', ' A form appears that allows you to edit all information on the current order.\r\n', 'radio', 1),
(138, 31, 'B', ' A form appears that allows you to edit shipping information of the current order only.\r\n', 'radio', 1),
(139, 31, 'C', ' Depending on the order status, different editing forms appear for the current order.\r\n', 'radio', 1),
(140, 31, 'D', ' The current order is canceled and a new order is created from scratch based on the current\r\norder''s data.', 'radio', 1),
(141, 32, 'A', ' $entityModel->loadEntity($id)\r\n', 'checkbox', 1),
(142, 32, 'B', ' $entityModel->load($attributeValue,$attributeCode)\r\n', 'checkbox', 1),
(143, 32, 'C', ' $entityModel->loadById($id)\r\n', 'checkbox', 1),
(144, 32, 'D', ' $entityModel->loadEntity($attributeCode, $attributeValue)\r\n', 'checkbox', 1),
(145, 32, 'E', ' $entityModel->load($id)', 'checkbox', 1),
(146, 33, 'A', ' Mage_Adminhtml_Block_Widget\r\n', 'radio', 1),
(147, 33, 'B', ' Mage_Core_Block_Abstract\r\n', 'radio', 1),
(148, 33, 'C', ' Mage_Adminhtml_Block_Abstract\r\n', 'radio', 1),
(149, 33, 'D', ' Mage_Adminhtml_Block_Template\r\n', 'radio', 1),
(150, 33, 'E', ' Varien_Data_Form_Abstract', 'radio', 1),
(151, 34, 'A', ' Payment Info\r\n', 'radio', 1),
(152, 34, 'B', ' Order Payment\r\n', 'radio', 1),
(153, 34, 'C', ' Payment Method\r\n', 'radio', 1),
(154, 34, 'D', ' Invoice', 'radio', 1),
(155, 36, 'A', 'You can define this list by modifying the list of elements found in the configuration with the\r\nxpath global/fieldsets/sales_convert_quote.\r\n', 'radio', 1),
(156, 36, 'B', ' You can define this list by modifying the list of elements found in the configuration with the\r\nxpath global/sales/quote/item/product_attributes.\r\n', 'radio', 1),
(157, 36, 'C', ' You can define this list by checking the checkbox on the attribute edit page in the admin.\r\n', 'radio', 1),
(158, 36, 'D', ' You cannot modify the list of fields copied from quote to order because the process is\r\nhardcoded.', 'radio', 1),
(159, 37, 'A', ' The model class consists of properties and methods for storing and manipulating data retrieved\r\nvia separate resource classes responsible for database operations.\r\n', 'radio', 1),
(160, 37, 'B', ' The model class is responsible for loading the frontend layout templates and responding to\r\npage requests via its Action methods (for example, indexAction).\r\n', 'radio', 1),
(161, 37, 'C', ' The model class does not encapsulate any logic except for logic providing access to the data\r\nloaded from the database.\r\n', 'radio', 1),
(162, 37, 'D', ' The model class is primarily responsible for direct query operations such as retrieving and\r\nstoring data and then rendering that data to the frontend view.', 'radio', 1),
(163, 38, 'A', ' Set the protected property $_debug of the payment model to true\r\n', 'radio', 1),
(164, 38, 'B', ' Set the config node default/payment/debug/[method code] to 1\r\n', 'radio', 1),
(165, 38, 'C', ' Call Mage:: register (''''payment_method_debug_'''' . [method code], true);\r\n', 'radio', 1),
(166, 38, 'D', ' Set the config node default/payment/ [method code]/debug to 1\r\n', 'radio', 1),
(167, 38, 'E', ' Call setDebug(true) on the payment method model', 'radio', 1),
(168, 39, 'A', ' fullReindex( )\r\n', 'radio', 1),
(169, 39, 'B', ' reindexAH( )\r\n', 'radio', 1),
(170, 39, 'C', ' processEvent( )\r\n', 'radio', 1),
(171, 39, 'D', ' reindex( )', 'radio', 1),
(172, 40, 'A', ' global/customer/helpers/address\r\n', 'radio', 1),
(173, 40, 'B', ' global/rewrite/helpers/rewrite/address\r\n', 'radio', 1),
(174, 40, 'C', ' global/helpers/customer/rewrite/address\r\n', 'radio', 1),
(175, 40, 'D', ' global/helpers/rewrite/customer_address\r\n', 'radio', 1),
(176, 40, 'E', ' global/helpers/rewrite/customer/address', 'radio', 1),
(177, 41, 'A', ' Namespace_ModuleName_IndexControllet\r\n', 'radio', 1),
(178, 41, 'B', ' Namespace_ModuleName_Controller_ControllecInclex\r\n', 'radio', 1),
(179, 41, 'C', ' Namespace_ModuleName_Controller_IndexController\r\n', 'radio', 1),
(180, 41, 'D', ' Namespace_Modulename_ControllerController', 'radio', 1),
(181, 42, 'A', ' sales_flat_order\r\n', 'radio', 1),
(182, 42, 'B', ' sales_flat_order_state\r\n', 'radio', 1),
(183, 42, 'C', ' sales_flat_order_status\r\n', 'radio', 1),
(184, 42, 'D', ' sales_flat_order_status_history', 'radio', 1),
(185, 43, 'A', ' _toHtml( )\r\n', 'radio', 1),
(186, 43, 'B', ' toHtml( )\r\n', 'radio', 1),
(187, 43, 'C', ' setLayout( )\r\n', 'radio', 1),
(188, 43, 'D', ' renderLayout( )', 'radio', 1),
(189, 44, 'A', ' the number of options\r\n', 'radio', 1),
(190, 44, 'B', ' the number of options+1\r\n', 'radio', 1),
(191, 44, 'C', ' always 1\r\n', 'radio', 1),
(192, 44, 'D', ' always 2', 'radio', 1),
(193, 45, 'A', ' $model->saveAttribute($attributeCode);\r\n', 'radio', 1),
(194, 45, 'B', ' $model->save($attributeCode);\r\n', 'radio', 1),
(195, 45, 'C', ' $model->getResource( )->saveAttribute($model, $attributeCode);\r\n', 'radio', 1),
(196, 45, 'D', ' $model->getResource( )->save($model, $attributeCode);', 'radio', 1),
(197, 46, 'A', ' the ''value'' of the attribute named''some''is saved in the eav_values table\r\n', 'radio', 1),
(198, 46, 'B', ' the ''value'' of the attribute named '' some'' is saved in one of the entity''s tables depending on its\r\ndatatype (for example, entityname_varchar)\r\n', 'radio', 1),
(199, 46, 'C', ' the data will be stored in the EAV registry making '' some'' ''value'' available to the entity\r\n', 'radio', 1),
(200, 46, 'D', ' the ''value'' of the attribute named ''some'' is saved in the eav_attribute_values table', 'radio', 1),
(201, 47, 'A', ' to send a SOAP request from Magento to a third-party system\r\n', 'radio', 1),
(202, 47, 'B', ' to receive a SOAP request from a third-party system to Magento\r\n', 'radio', 1),
(203, 47, 'C', ' to send or receive SOAP requests in Magento\r\n', 'radio', 1),
(204, 47, 'D', ' to provide tracking on the order success page', 'radio', 1),
(205, 48, 'A', ' Mage_Core_Model_Mysql4_Setup\r\n', 'radio', 1),
(206, 48, 'B', ' Mage_Core_Model_Resource_Setup_Default\r\n', 'radio', 1),
(207, 48, 'C', ' Mage_Setup_Model_Resource_Default\r\n', 'radio', 1),
(208, 48, 'D', ' Mage_Core_Model_Resource_Setup', 'radio', 1),
(209, 49, 'A', ' Admin, Standard, CMS, Default\r\n', 'radio', 1),
(210, 49, 'B', ' Default, CMS, Standard, Admin\r\n', 'radio', 1),
(211, 49, 'C', ' Admin, CMS, Standard, Default\r\n', 'radio', 1),
(212, 49, 'D', ' Standard, Admin, Default, CMS', 'radio', 1),
(213, 51, 'A', ' Mage_Core_Controller_Front_Action\r\n', 'radio', 1),
(214, 51, 'B', ' Mage_Adminhtml_Controller_Action\r\n', 'radio', 1),
(215, 51, 'C', ' Mage_Core_Controller_Varien_Front\r\n', 'radio', 1),
(216, 51, 'D', ' Mage_Core_Controller_Abstract', 'radio', 1),
(217, 52, 'A', ' catalog_product_link\r\n', 'radio', 1),
(218, 52, 'B', ' catalog_product_super_link\r\n', 'radio', 1),
(219, 52, 'C', ' catalog_product_option\r\n', 'radio', 1),
(220, 52, 'D', ' catalog_product_relation', 'radio', 1),
(221, 53, 'A', ' $quote->getShippingAddress( )-\r\n>setPaymentMethod(isset($data[''method'']) ? $data[''method''] : null); inside\r\nMage_Checkout_Model_Type_Onepage\r\n', 'radio', 1),
(222, 53, 'B', ' .public function setPayment(Mage_Sales_Model_Quote_Payment$payment) inside\r\nMage_Sales_Model_Quote\r\n', 'radio', 1),
(223, 53, 'C', ' $method = $this->getMethodInstance( ); inside Mage_Sales_Model_Quote_Payment\r\n', 'radio', 1),
(224, 53, 'D', ' $instance->setInfoInstance($this); inside Mage_Payment_Model_Info', 'radio', 1),
(225, 54, 'A', ' Controller\r\n', 'radio', 1),
(226, 54, 'B', ' Helper\r\n', 'radio', 1),
(227, 54, 'C', ' Model\r\n', 'radio', 1),
(228, 54, 'D', ' Resource model', 'radio', 1),
(229, 56, 'A', 'method (or function) name\r\n', 'checkbox', 1),
(230, 56, 'B', ' method (or function) arguments\r\n', 'checkbox', 1),
(231, 56, 'C', ' class name\r\n', 'checkbox', 1),
(232, 56, 'D', ' object type (singleton, model, none, etc)\r\n', 'checkbox', 1),
(233, 56, 'E', ' call order\r\n', 'checkbox', 1),
(234, 56, 'F', ' active/inactive status', 'checkbox', 1),
(235, 57, 'A', ' use the native sales_order.update API call with the url/api/xmlrpc/\r\n', 'radio', 1),
(236, 57, 'B', ' create a custom API resource which allows you to receive XmlRpc requests\r\n', 'radio', 1),
(237, 57, 'C', ' create a custom API adapter to receive XmlRpc requests\r\n', 'radio', 1),
(238, 57, 'D', ' create a custom API handler to process XmlRpc requests', 'radio', 1),
(239, 58, 'A', 'Declare your module''s block class prefix in the config.xml file.\r\n', 'checkbox', 1),
(240, 58, 'B', ' Implement a sub-class of Mage_Adminhtml_Block_widget_Form.\r\n', 'checkbox', 1),
(241, 58, 'C', ' Implement a sub-class of Mage_Adminhtml_Block_Form_Abstcact.\r\n', 'checkbox', 1),
(242, 58, 'D', ' Create sub-classes of Mage_Adminhtml_Block_Form_Element_Abstract for each form field to\r\nbe presented.\r\n', 'checkbox', 1),
(243, 58, 'E', ' Add a set of configuration values in the module''s config.xml defining the form fields to be\r\ndisplayed,', 'checkbox', 1),
(244, 60, 'A', ' data model\r\n', 'checkbox', 1),
(245, 60, 'B', ' data helper\r\n', 'checkbox', 1),
(246, 60, 'C', ' resource model\r\n', 'checkbox', 1),
(247, 60, 'D', ' resource collection\r\n', 'checkbox', 1),
(248, 60, 'E', ' setup class', 'checkbox', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_language`
--

CREATE TABLE IF NOT EXISTS `tbl_language` (
  `id_language` int(11) NOT NULL AUTO_INCREMENT,
  `title_language` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `status_language` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_language`
--

INSERT INTO `tbl_language` (`id_language`, `title_language`, `status_language`) VALUES
(1, 'JAVA', 1),
(2, 'PHP', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_questions`
--

CREATE TABLE IF NOT EXISTS `tbl_questions` (
  `id_questions` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) NOT NULL,
  `description_question` text COLLATE utf8_unicode_ci NOT NULL,
  `answer_question` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `status_question` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_questions`),
  KEY `fk_question_type` (`id_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=103 ;

--
-- Extraindo dados da tabela `tbl_questions`
--

INSERT INTO `tbl_questions` (`id_questions`, `id_type`, `description_question`, `answer_question`, `status_question`) VALUES
(1, 1, 'For an attribute to be loaded on a catalog/product object, which two of the following conditions\r\nmust be satisfied? (Choose two)', 'A,C', 1),
(2, 1, 'What class does an adminhtml grid directly extend?', 'A', 1),
(3, 1, 'You have a product collection and want to add a filter to get all products whose name starts with\r\nTest or whose price is 0.00.\r\nWhich of the following statements would add that OR condition?\r\nsee exhibit below...', 'A', 1),
(4, 1, 'Which three of the following conditions are used to protect an admin route via ACL? (Choose\r\nthree)', 'A,C,D', 1),
(5, 1, 'Which table is used for calculating a new increment ID for an order?', 'B', 1),
(6, 1, 'Which one of the following API methods exists in Magento?', 'D', 1),
(7, 1, 'Which one of the following classes must you extend in order to implement a custom indexer?', 'D', 1),
(8, 1, 'Which two EAV attribute frontend_input types make use of source models? (Choose two)', 'C,D', 1),
(9, 1, 'What is the difference in the effect of calling the invoice capture ( ) method versus the invoice pay\r\n( ) method?', 'C', 1),
(10, 1, 'How is the sort order in which total models collect their values specified?', 'A', 1),
(11, 1, 'Which method is called on a shipping carrier model to fetch a list of all available shipping methods,\r\nalong with the rates associated with them, for a quote address?', 'E', 1),
(12, 1, 'Which one of the following EAV attribute types may be used for layered navigation in native\r\nMagento?', 'C', 1),
(13, 1, 'You are creating a custom CMS module named Achme_Cms. Which one of the following is the\r\ncorrect XML required to override a controller from the Mage_Cms module in your Achme_Cms\r\nmodule?\r\nsee exhibit below...', 'A', 1),
(14, 1, 'Which of the following options would cause a poll/poll collection to load all entities that have been\r\nposted during April, 2011?\r\nsee exhibit below...', 'B', 1),
(15, 1, 'The final price for the product on the product view page is__________.', 'D', 1),
(16, 1, 'Which of the following is a true statement about how Magento loads data for an EAV-based data\r\nmodel?', 'B', 1),
(17, 1, 'Which one of the following class types directly charges a credit card when you capture an invoice\r\nin Magento admin?', 'D', 1),
(18, 1, 'Applying the shopping cart rule''s action affects the quote item by setting the quote item''s\r\n___________.', 'B', 1),
(19, 1, 'Which one of the following statements is true regarding Mage_Core_Block_Text_List?', 'C', 1),
(20, 1, 'Which one of the following API protocols does native Magento support?', 'A', 1),
(21, 1, 'What is the difference between the base_grand_total and grand_total attributes of the order?', 'D', 1),
(22, 1, 'Which object never encapsulates any shopping cart items?', 'B', 1),
(23, 1, 'Which of the following items is NOT utilized in Magento''''s implementation of EAV-based data\r\nmodels?', 'C', 1),
(24, 1, 'Which four of these xml elements are used in system.xml to configure a system configuration\r\nproperty? (Choose four)', 'A,C,D,F', 1),
(25, 1, 'Which two of the following are supported in the native Magento API? (Choose two)', 'B,E', 1),
(26, 1, 'Which of the following API calls allows you to fetch the list of related products using the native\r\nMagento API?', 'A', 1),
(27, 1, 'Which two of the following will return an instance of a block object? (Choose two)\r\nsee exhibit below...', 'D,F', 1),
(28, 1, 'Inside the XML node config/global/blocks, what is the correct xpath for rewriting the\r\ncatalog/product_view block?', 'E', 1),
(29, 1, 'Which statement correctly describes order state and order status?', 'B', 1),
(30, 1, 'Which three of the following conditions should exclude a quote item from the shipping rate\r\ncalculation by a carrier model? (Choose three', 'A,B,D', 1),
(31, 1, 'What happens when you edit an existing order using the order management page?', 'D', 1),
(32, 1, 'Which two of the following methods can be used to bad an entity''s data from its configured data\r\ntable? (Choose two)', 'B,E', 1),
(33, 1, 'Which class is extended to render a dropdown in admin forms?', 'E', 1),
(34, 1, 'Which one of the following is responsible for sending a remote request to the payment service\r\nwhen capturing an order?', 'C', 1),
(35, 1, 'see exhibit below,,,\r\nThe checkbox "Use default value" is checked and the corresponding input field is disabled, as\r\nshown in the graphic above. How does Magento represent this state in the corresponding EAV\r\nvalue tables?', 'B', 1),
(36, 1, 'You want to define a list of quote object attributes that are copied to the order object when an\r\norder is placed. Which one of the following statements is true?', 'A', 1),
(37, 1, 'Which statement describes a model class that extends Mage_Core_Model_Abstract?', 'A', 1),
(38, 1, 'Which of the following actions will enable logging via calls to debugData( ) on a native Magento\r\npayment method model?', 'D', 1),
(39, 1, 'Which method is responsible for a full re-index in the abstract Magento indexer?', 'B', 1),
(40, 1, 'Which one of the following xpaths is correct for replacing\r\nMage_Customer_Model_Custom_Address via Mage::helper (''customer/address'')?', 'C', 1),
(41, 1, 'Which one of the following controller classes could respond to this URL?:\r\nhttp://example.com/modulename/controller/index', 'D', 1),
(42, 1, 'In which table could you find the order state?', 'A', 1),
(43, 1, 'Which of the following block methods is the best to override when there is a need to customize\r\nhow the block''s html is rendered?', 'A', 1),
(44, 1, 'How many items will be added to the quote after adding a configurable product to the shopping\r\ncart?', 'D', 1),
(45, 1, 'Which of the following allows you to save a single attribute value on an EAV entity?', 'C', 1),
(46, 1, 'When setData (''some'', ''value'') is called on an EAV entity and the entity is saved to the database,\r\n__________________.', 'B', 1),
(47, 1, 'In which of the following integrations should you use the Magento API?', 'B', 1),
(48, 1, 'Which of the following is the default setup script class name?', 'D', 1),
(49, 1, 'In what order are the routers from the Magento core checked for a matching route?', 'A', 1),
(50, 1, 'Which of the following will NOT generate a tag in the output of the standard Magento\r\npage/html_head block?\r\nsee exhibit below...', 'C', 1),
(51, 1, 'A custom frontend controller will extend which one of the following classes?', 'A', 1),
(52, 1, 'Which table stores information about the relationship between configurable products and their\r\nchild products?', 'B', 1),
(53, 1, 'Which of the following lines includes a payment method object?', 'C', 1),
(54, 1, 'What type of Magento class is an API resource?', 'C', 1),
(55, 1, 'A valid way to extend Mage_Adminhtml_Cms_PageController with the\r\nAcme_Cms_Adminhtml PageController class would be to set the following configuration;\r\nsee exhibit below...', 'A', 1),
(56, 1, 'When you register an event observer, which two of the following pieces of information are required\r\nfor it to function? (Choose two)', 'A,C', 1),
(57, 1, 'To update your order information from a third-party system using an XmlRpc call, you should\r\n_______________.', 'A', 1),
(58, 1, 'Which of the following layout XML directives will set a value on a block?\r\nsee exhibit below...', 'D', 1),
(59, 1, 'To implement a standard Adminhtml form for a custom data model, which two of the following\r\nmust you do? (Choose two)', 'A,B', 1),
(60, 1, 'Which three of the following object types will have a parent class found in the Mage_Eav module\r\nfor the purposes of EAV data storage in Magento? (Choose three)', 'C,D,E', 1),
(61, 1, 'Given a grid interface that extends from Mage_Adminhtml_Block_widget_Grid, which of the\r\nfollowing methods could you override to allow data to be loaded from a custom data collection?', 'B', 1),
(62, 1, 'When changes are made to more than one of a collection''s items using setData (''some'', ''value''),\r\nwhich of the following methods will save the changes in the collection?', 'D', 1),
(63, 1, 'You want to implement a custom attribute source model. Which method do you have to implement\r\nafter extending Mage_Eav_Model_Entity_Attribute_Source_Abstract?', 'B', 1),
(64, 1, 'How can you make a payment method store entire credit card numbers?', 'C', 1),
(65, 1, 'When the Magento configuration is being loaded, all the XML files in app/etc and the module\r\nregistration files under app/etc/modules/ are loaded first. After that step, in which order are the\r\nfollowing items loaded?', 'C', 1),
(66, 1, 'Which one of the following declares a Layout XML file?\r\nsee exhibit below...', 'D', 1),
(67, 1, 'In order to successfully register and configure a new entity capable of being saved and loaded\r\nfrom the database, you must create a model and which three of the following? (Choose three)', 'B,E,F', 1),
(68, 1, 'What does Magento use to determine whether the automatically run upgrade scripts have been\r\nrun yet?', 'C', 1),
(69, 1, 'Assume that PayPal has presented a new API for online purchasing that you are going to use.\r\nWhich class should you extend for doing that?', 'C', 1),
(70, 1, 'Which two public methods must be implemented in a functional custom shipping method directly\r\nextending Mage_Shipping_Model_Carrier_Abstract and also implementing\r\nMage_Shipping_Model_Carrier_Interface? (Choose two)', 'A,B', 1),
(71, 1, 'The initial call to ______________ will create and return an instance of the specified class.\r\nSubsequent calls to this method during the same execution cycle will return the same class\r\ninstance as opposed to creating a new one.', 'D', 1),
(72, 1, 'You want to display a grid for a custom collection. After extending\r\nMage_Adminhtml_Block_widget_Grid, which two of these methods should you implement?\r\n(Choose two)', 'B,C', 1),
(73, 1, 'What is the basic class/interface for every model observer class?', 'D', 1),
(74, 1, 'You want to filter a product collection so that it will return only SKUs 12 and 123. You will use a\r\ncall to $collection->addFieldToFilter (''sku'', ____________ );', 'B,D', 1),
(75, 1, 'How can you update a third-party system with every new order created in Magento?', 'C', 1),
(76, 1, 'Which of the following xpaths defines the correct XML structure for informing Magento that your\r\nmodule has install scripts?', 'C', 1),
(77, 1, 'You have used the "refresh"'' action on the cache management page for the block html cache type.\r\nWhich of the following types of cache record would be cleared?', 'C', 1),
(78, 1, 'Which of the following methods will force an EAV resource collection model to include an attribute\r\nin its result set?', 'A', 1),
(79, 1, 'Assume you have product with qty in stock=1, and two people are trying to buy it at the same time.\r\nWhich of the following statements is true?', 'B', 1),
(80, 1, 'In which config areas are layout files declared? (Choose two)', 'B,D', 1),
(81, 1, 'To register a new API resource, what should you do?', 'B', 1),
(82, 1, 'Two modules, Foo and Moo, both rewrite the catalog/product model, but only the Moo module''s\r\nrewrite is being used. Both modules Foo and Moo reside in the community code pool. Which two\r\napproaches allow the functionality from both classes to be used? (Choose two)', 'B,C', 1),
(83, 1, 'In admin, a shipment can be created ____________.', 'C', 1),
(84, 1, 'How can you restrict access to a custom API resource?', 'B', 1),
(85, 1, 'What must be done to allow a third-party system to access the Magento API?', 'A', 1),
(86, 1, 'Which one of the following statements is true regarding layout update handles?', 'D', 1),
(87, 1, 'Which three of the following will return an instance of a resource model? (Choose three)', 'A,B,E', 1),
(88, 1, 'By enabling Flat catalog, you will ____________.', 'A', 1),
(89, 1, 'Which of the following payment methods'' payment actions creates an invoice during the "place\r\norder" step?', 'C', 1),
(90, 1, 'Which model is responsible for calculating the taxes for the selected shipping rate?', 'C', 1),
(91, 1, 'A native Magento EAV entity will use_____________.', 'C', 1),
(92, 1, 'In which order are the following methods executed after Mage_Core_Model_Abstract::save ( ) is\r\ncalled?', 'C', 1),
(93, 1, 'Which of the following node names may be used inside the setup resource declaration to utilize a\r\ncustom setup class?', 'B', 1),
(94, 1, 'How does Magento store comments regarding different entities (invoice, credit memo, shipment)?', 'B', 1),
(95, 1, 'Which file path correctly identifies the location of a modules install/upgrade scripts inside the\r\nprimary module directory?', 'A', 1),
(96, 1, 'Given an EAV-based data model whose data is stored in the table foo_entity, in which table would\r\nyou find the values for an attribute of the varchar type?', 'B', 1),
(97, 1, 'A customer bought two items but wants to cancel one. Which option enables the administrator of\r\nthe site to edit the quantity while the invoice is being captured in the admin area?', 'B', 1),
(98, 1, 'Which one of the following classes does NOT exist in Magento?', 'A', 1),
(99, 1, 'What do you need to do to implement a completely new Web Service protocol in Magento?', 'A', 1),
(100, 1, 'What is the xpath to the list of product types?', 'B', 1),
(101, 1, 'For which two of the following composite products could the options be shipped separately on the\r\nfrontend using "Checkout with multiple addresses"? (Choose two)', 'B,C', 1),
(102, 1, 'Assume you added a product with custom options to the shopping cart. Where will the data for the\r\ncustom options be stored persistently?', 'D', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_role`
--

CREATE TABLE IF NOT EXISTS `tbl_role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `title_role` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `status_role` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_type`
--

CREATE TABLE IF NOT EXISTS `tbl_type` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `id_language` int(11) NOT NULL,
  `title_type` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `status_type` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_type`),
  KEY `fk_type_language` (`id_language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tbl_type`
--

INSERT INTO `tbl_type` (`id_type`, `id_language`, `title_type`, `status_type`) VALUES
(1, 2, 'MAGENTO', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(11) NOT NULL,
  `name_user` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `login_user` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password_user` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `email_user` varchar(199) COLLATE utf8_unicode_ci NOT NULL,
  `status_user` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_user`),
  KEY `fk_user_role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tbl_alternative`
--
ALTER TABLE `tbl_alternative`
  ADD CONSTRAINT `tbl_alternative_ibfk_1` FOREIGN KEY (`id_questions`) REFERENCES `tbl_questions` (`id_questions`);

--
-- Limitadores para a tabela `tbl_questions`
--
ALTER TABLE `tbl_questions`
  ADD CONSTRAINT `fk_question_type` FOREIGN KEY (`id_type`) REFERENCES `tbl_type` (`id_type`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_type`
--
ALTER TABLE `tbl_type`
  ADD CONSTRAINT `fk_type_language` FOREIGN KEY (`id_language`) REFERENCES `tbl_language` (`id_language`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `fk_user_role` FOREIGN KEY (`id_role`) REFERENCES `tbl_role` (`id_role`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
