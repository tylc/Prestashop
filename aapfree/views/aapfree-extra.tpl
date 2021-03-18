{*
 *
 * PrestaShop module created by VEKIA, a guy from official PrestaShop community ;-)
 *
 * @author    VEKIA https://www.prestashop.com/forums/user/132608-vekia/
 * @copyright 2010-2020 VEKIA
 * @license   This program is not free software and you can't resell and redistribute it
 *
 * CONTACT WITH DEVELOPER http://mypresta.eu
 * support@mypresta.eu
 *
 *}
<a id="send_aap_button" class="btn btn-primary" href="#send_AAP_form">
    <i class="material-icons">help</i>{l s='Ask about product' mod='aapfree'}
</a>

<div style="display: none;">
    <div id="send_AAP_form" class="card">
        <div class="card-block">
            <!--<div class="product clearfix col-lg-12">
                <img src="{$link->getImageLink($aapfree_product->link_rewrite, $aapfree_product_cover, 'home_default')|escape:'html'}" alt="{$aapfree_product->name|escape:html:'UTF-8'}"/>
                <div class="product_desc">
                    <p class="product_name"><strong>{$aapfree_product->name}</strong></p>
                    {$aapfree_product->description_short nofilter}
                </div>
            </div>-->
				<div class="product clearfix col-lg-12">
					<div class="product_desc">
						<p class="product_name"><strong>{$aapfree_product->name}</strong></p>
					</div>
				</div>

            <div class="col-lg-6">
                <fieldset class="form-group">
                    <label class="form-control-label" for="question">{l s='Your question' mod='aapfree'}</label>
                    <textarea name="aapfree_question" id="aapfree_question" class="form-control"></textarea>
                </fieldset>
            </div>

            <div class="send_AAP_form_content col-lg-6" id="send_AAP_form_content">
                <div id="send_AAP_form_error" class="alert alert-danger" style="display:none;"></div>
                <div class="form_container">
                    {if !Context::getContext()->customer->islogged()}
                        <fieldset class="form-group">
                            <label class="form-control-label" for="author">{l s='Your name' mod='aapfree'}</label>
                            <input id="aapfree_author" name="aapfree_author" type="text" value="" class="form-control"/>
                        </fieldset>
                    {else}
                        <fieldset class="form-group">
                            <label class="form-control-label" for="author">{l s='Your name' mod='aapfree'}</label>
                            <input disabled id="aapfree_author" name="aapfree_author" type="text" value="{Context::getContext()->customer->firstname} {Context::getContext()->customer->lastname}" class="form-control disabled"/>
                            <p class="small">({l s='You are logged as a customer, we get your name automatically from your account details' mod='aapfree'})</p>
                        </fieldset>
                    {/if}
                    {if !Context::getContext()->customer->islogged()}
                        <fieldset class="form-group">
                            <label class="form-control-label" for="aapfree_email">{l s='Your email address' mod='aapfree'}</label>
                            <input id="aapfree_email" name="aapfree_email" type="text" value="" class="form-control"/>
                        </fieldset>
                    {else}
                        <fieldset class="form-group">
                            <label class="form-control-label" for="aapfree_email">{l s='Your email address' mod='aapfree'}</label>
                            <input id="aapfree_email" name="aapfree_email" type="text" value="{Context::getContext()->customer->email}" class="form-control"/>
                        </fieldset>
                    {/if}
                    <fieldset class="form-group">
                        <label class="form-control-label" for="author">{l s='Phone number' mod='aapfree'}</label>
                        <input id="aapfree_phone" name="aapfree_phone" type="text" value="" class="form-control"/>
                    </fieldset>
                </div>
            </div>
            <div class="col-lg-12 send_AAP_form_content_button">
                <p class="submit pull-right">
                    {if $aapfree_GDPR == 1}
                    {literal}
                        <input onchange="if($(this).is(':checked')){$('#sendAAPEmail').removeClass('gdpr_disabled'); $('#sendAAPEmail').removeAttr('disabled'); $('#sendAAPEmail').click(function(){aapfreeEmail();});}else{$('#sendAAPEmail').addClass('gdpr_disabled'); $('#sendAAPEmail').off('click'); $('#sendAAPEmail').attr('disabled', 1); }"
                               id="gdpr_checkbox" type="checkbox">
                    {/literal}
                        {l s='I accept ' mod='aapfree'}
                        <a target="_blank"
                           href="{$link->getCmsLink($aapfree_GDPRCMS)}">{l s='privacy policy' mod='aapfree'}</a>
                        {l s='rules' mod='aapfree'}
                    {/if} &nbsp;
                    <input {if $aapfree_GDPR == 1}disabled{/if} id="sendAAPEmail" class="btn btn-primary {if $aapfree_GDPR == 1}gdpr_disabled{/if}" name="sendAAPEmail" type="submit" value="{l s='Send' mod='aapfree'}"/>
                    <input id="id_product_send" name="id_product" type="hidden" value="{$aapfree_product->id}"/>
                </p>
            </div>
        </div>
    </div>
</div>