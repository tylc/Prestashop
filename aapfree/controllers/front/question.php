<?php
/**
 * PrestaShop module created by VEKIA, a guy from official PrestaShop community ;-)
 *
 * @author    VEKIA https://www.prestashop.com/forums/user/132608-vekia/
 * @copyright 2010-2019 VEKIA
 * @license   This program is not free software and you can't resell and redistribute it
 *
 * CONTACT WITH DEVELOPER http://mypresta.eu
 * support@mypresta.eu
 */

include_once(dirname(__FILE__) . '../../../aapfree.php');

class aapfreequestionModuleFrontController extends ModuleFrontController
{
    public function initContent()
    {
        if (Module::isEnabled('aapfree') && Tools::getValue('action') == 'sendQuestion' && Tools::getValue('secure_key') == $this->module->secure_key) {
            // Retrocompatibilty with old theme

            $customerMail = Tools::getValue('email');
            $author = Tools::getValue('author');
            $phone = Tools::getValue('phone');
            $id_product = Tools::getValue('id_product');
            $question = Tools::getValue('question');

            if (!$customerMail || !$id_product) {
                die('0');
            }

            $isValidEmail = Validate::isEmail($customerMail);
            if (false === $isValidEmail) {
                die('0');
            }

            /* Email generation */
            $product = new Product((int)$id_product, false, Tools::getValue('id_lang'));
            $productLink = Context::getContext()->link->getProductLink($product);

            $templateVars = array(
                '{product}' => $product->name,
                '{product_link}' => $productLink,
                '{customer}' => $author,
                '{phone}' => $phone,
                '{customerMail}' => $customerMail,
                '{question}' => $question
            );

            /* Email sending */
            if (!Mail::Send((int)Tools::getValue('id_lang'),
                'send_question',
                sprintf(Configuration::get('aapfree_TITLE', (int)Tools::getValue('id_lang')), $author, $product->name),
                $templateVars,
                Configuration::get('PS_SHOP_EMAIL'),
                null,
                null,
                null,
                null,
                null,
                dirname(__FILE__) . '/mails/',
                false,
                Context::getContext()->shop->id,
                null,
                $customerMail,
                $author
            )) {
                die('0');
            }
            die('1');
        }
        die('0');
    }
}