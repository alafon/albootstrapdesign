{def $collection = cond( $collection_id, fetch( content, collected_info_collection, hash( collection_id, $collection_id ) ),
                          fetch( content, collected_info_collection, hash( contentobject_id, $node.contentobject_id ) ) )}

{set-block scope=global variable=title}{'Form %formname'|i18n( 'design/ezwebin/collectedinfo/form', , hash( '%formname', $node.name|wash() ) )}{/set-block}

<div class="page-header">
    <h1>{$object.name|wash}</h1>
</div>


<div class="alert-message block-message success">
    <h4>{'Thank you for your feedback.'|i18n( 'design/ezwebin/collectedinfo/form' )}</h4>

    {if $error}

    {if $error_existing_data}
    <p>{'You have already submitted this form. The data you entered was:'|i18n('design/ezwebin/collectedinfo/form')}</p>
    {/if}

    {/if}

    <ul>
    {foreach $collection.attributes as $attribute}
    <li><strong>{$attribute.contentclass_attribute_name|wash}:</strong> {attribute_result_gui view=info attribute=$attribute}</li>
    {/foreach}
    </ul>

    <p/>

    <div class="alert-actions">
        <a class="btn" href={$node.parent.url|ezurl}>{'Return to site'|i18n('design/ezwebin/collectedinfo/form')}</a>
    </div>

</div>
