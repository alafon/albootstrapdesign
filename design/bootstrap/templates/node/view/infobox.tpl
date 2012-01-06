{if is_set( $extra_menu_width )|not}
{def $extra_menu_width = 4}
{/if}
<div class="row">
    <div class="span{$extra_menu_width}">

    <h3>{attribute_view_gui attribute=$node.object.data_map.header}</h3>

{if $node.object.data_map.image.has_content}
    <div class="attribute-image"> 
        {attribute_view_gui attribute=$node.object.data_map.image href=$node.object.data_map.image_url.data_text image_class='infoboximage'} 
    </div>
{/if}

        {attribute_view_gui attribute=$node.object.data_map.content}
        <p>{attribute_view_gui attribute=$node.object.data_map.url}</p>

{if or( $node.object.can_edit, $node.object.can_remove )}
        <form action={"/content/action"|ezurl} method="post">
        {if $node.object.can_edit}
            <input class="" type="image" name="EditButton" src={"edit-infobox-ico.gif"|ezimage} alt="Edit" />
            <input type="hidden" name="ContentObjectLanguageCode" value="{$node.object.current_language}" />
        {/if}
        {if $node.object.can_remove}
            <input class="" type="image" name="ActionRemove" src={"trash-infobox-ico.gif"|ezimage} alt="Remove" />
        {/if}
            <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
            <input type="hidden" name="NodeID" value="{$node.node_id}" />
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
        </form>
{/if}
    </div>
</div>