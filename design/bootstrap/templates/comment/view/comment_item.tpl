{if not( is_set( $self_edit ) )}
    {def $self_edit=false()}
{/if}

{if not( is_set( $self_delete ) )}
    {def $self_delete=false()}
{/if}

<div class="row ezcom-view-comment">
    <div class="span2">
        <h4 class="author">
            {if $comment.url|eq( '' )}
                {$comment.name|wash}
            {else}
                <a href="{$comment.url|wash}" target="_blank">
                    {if $comment.name}{$comment.name|wash}{else}anonymous{/if}
                </a>
            {/if}
        </h4>
        <p class="date">
            <span class="month">{$comment.created|datetime( 'custom', '%M' )}</span>
            <span class="day">{$comment.created|datetime( 'custom', '%d' )}</span>
            <span class="year">{$comment.created|datetime( 'custom', '%Y' )}</span>
        </p>
        <img class="gravatar" src="https://secure.gravatar.com/avatar/870571b33093707be4918dc0a4aa64b1" />
    </div>
    <div class="span10">
        {if $comment.title}
        <div class="ezcom-comment-title">
            <h4>{$comment.title|wash}</h4>
        </div>
        {/if}
        <div class="ezcom-comment-body">
            <p>
              {$comment.text|wash|nl2br}
            </p>
        </div>
        {def $can_edit=fetch( 'comment', 'has_access_to_function', hash( 'function', 'edit',
                                                                         'contentobject', $contentobject,
                                                                         'language_code', $language_code,
                                                                         'comment', $comment,
                                                                         'scope', 'role',
                                                                         'node', $node ) )
             $can_delete=fetch( 'comment', 'has_access_to_function', hash( 'function', 'delete',
                                                                           'contentobject', $contentobject,
                                                                           'language_code', $language_code,
                                                                           'comment', $comment,
                                                                           'scope', 'role',
                                                                           'node', $node ) )
             $user_display_limit_class=concat( ' class="limitdisplay-user limitdisplay-user-', $comment.user_id, '"' )}

        {if or( $can_edit, $can_self_edit, $can_delete, $can_self_delete )}
        <div class="ezcom-comment-tool">
            {if or( $can_edit, $can_self_edit )}
                {if and( $can_self_edit, not( $can_edit ) )}
                    {def $displayAttribute=$user_display_limit_class}
                {else}
                    {def $displayAttribute=''}
                {/if}
                <span{$displayAttribute}>
                    <a href={concat( '/comment/edit/', $comment.id )|ezurl}>{'Edit'|i18n('ezcomments/comment/view')}</a>
                </span>
                {undef $displayAttribute}
            {/if}
            {if or( $can_delete, $can_self_delete )}
                {if and( $can_self_delete, not( $can_delete ) )}
                    {def $displayAttribute=$user_display_limit_class}
                {else}
                    {def $displayAttribute=''}
                {/if}
                <span {$displayAttribute}>
                    <a href={concat( '/comment/delete/',$comment.id )|ezurl}>
                        {'Delete'|i18n('ezcomments/comment/view')}
                    </a>
                </span>
                {undef $displayAttribute}
            {/if}
        </div>
        {/if}
        {undef $can_edit $can_delete}
    </div>
</div>