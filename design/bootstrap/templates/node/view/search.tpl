{def $preview_displayed = false()
     $short_attributes_list = array( 'short_description', 'intro' )
     $long_attributes_list = array( 'body', 'description' )}
     
<div class="row">
    <div class="span4"></div>
    <div class="span12">
        <h3>{$node.name|wash}</h3>
        {foreach $short_attributes_list as $short_attribute}
            {if and( is_set( $node.data_map[$short_attribute] ), $node.data_map[$short_attribute].has_content )}
                {$node.data_map[$short_attribute].data_text|strip_tags()|shorten(200)}
                {set $preview_displayed = true()}
                {break}
            {/if}
        {/foreach}
        {if $preview_displayed|eq(false())}
        {foreach $long_attributes_list as $long_attribute}
            {if and( is_set( $node.data_map[$long_attribute] ), $node.data_map[$long_attribute].has_content )}
                {$node.data_map[$long_attribute].data_text|strip_tags()|shorten(200)}
                {set $preview_displayed = true()}
                {break}
            {/if}
        {/foreach}
        {/if}
        <p><a href={$node.url_alias|ezurl}>{"Read more"|i18n( 'design/search' )}</a></p>
    </div>        
</div>
{undef $preview_displayed
       $short_attributes_list
       $long_attributes_list}