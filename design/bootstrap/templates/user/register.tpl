<form enctype="multipart/form-data"  action={"/user/register/"|ezurl} method="post" name="Register">

<div class="page-header">
    <h1>{"Register user"|i18n("design/ezwebin/user/register")}</h1>
</div>

{if and( and( is_set( $checkErrNodeId ), $checkErrNodeId ), eq( $checkErrNodeId, true() ) )}
    <div class="alert-message error">
        <p><span class="time">[{currentdate()|l10n( shortdatetime )}]</span> {$errMsg}</p>
    </div>
{/if}

{if $validation.processed}

    {if $validation.attributes|count|gt(0)}
        <div class="alert-message warning">
            <p>{"Input did not validate"|i18n("design/ezwebin/user/register")}</p>
        {foreach $validation.attributes as $attribute}
            <p>{$attribute.name}: {$attribute.description}</p>
        {/foreach}
        </div>
    {else}
        <div class="alert-message notice">
        <p>{"Input was stored successfully"|i18n("design/ezwebin/user/register")}</p>
        </div>
    {/if}

{/if}

{if count($content_attributes)|gt(0)}
    {foreach $content_attributes as $attribute}
    <input type="hidden" name="ContentObjectAttribute_id[]" value="{$attribute.id}" />
    <div class="clearfix">
        <label>{$attribute.contentclass_attribute.name}</label>
        <div class="input">
        {attribute_edit_gui attribute=$attribute}
        </div>
    </div>
    {/foreach}

    <div class="actions">
         <input type="hidden" name="UserID" value="{$content_attributes[0].contentobject_id}" />
    {if and( is_set( $checkErrNodeId ), $checkErrNodeId )|not()}
        <input class="btn primary" type="submit" id="PublishButton" name="PublishButton" value="{'Register'|i18n('design/ezwebin/user/register')}" onclick="window.setTimeout( disableButtons, 1 ); return true;" />
    {else}    
           <input class="btn primary" type="submit" id="PublishButton" name="PublishButton" disabled="disabled" value="{'Register'|i18n('design/ezwebin/user/register')}" onclick="window.setTimeout( disableButtons, 1 ); return true;" />
    {/if}
    <input class="btn" type="submit" id="CancelButton" name="CancelButton" value="{'Discard'|i18n('design/ezwebin/user/register')}" onclick="window.setTimeout( disableButtons, 1 ); return true;" />
    </div>
{else}
    <div class="alert-message warning">
         <h2>{"Unable to register new user"|i18n("design/ezwebin/user/register")}</h2>
    </div>
    <div class="actions">
    <input class="btn" type="submit" id="CancelButton" name="CancelButton" value="{'Back'|i18n('design/ezwebin/user/register')}" onclick="window.setTimeout( disableButtons, 1 ); return true;" />
    </div>
{/if}
</form>

{literal}
<script type="text/javascript">
<!--
    function disableButtons()
    {
        document.getElementById( 'PublishButton' ).disabled = true;
        document.getElementById( 'CancelButton' ).disabled = true;
    }
-->
</script>
{/literal}
