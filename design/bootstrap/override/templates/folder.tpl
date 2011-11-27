{set scope=global persistent_variable=hash( 'left_menu', false(),
                                            'extra_menu', array( 'extra_info' ) )}


<div class="row">
    <div class="span12">

        <div class="page-header">
            <h1>{$node.name|wash}</h1>
        </div>


        {foreach $node.data_map as $attribute_to_display}
            {*
                $node.object.content_class.contentobject_name is empty ? bug ?
                we should use this to avoid display the attribute used to generate the contentobject name
            *}
            {if $attribute_to_display.content|ne( $node.name )}
                {if $attribute_to_display.has_content}
                    {attribute_view_gui attribute=$attribute_to_display}
                {/if}
            {/if}
        {/foreach}

        {foreach fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                 'sort_by', $node.sort_array )) as $child}
            {node_view_gui view=line content_node=$child}
        {/foreach}
        
    </div>

</div>