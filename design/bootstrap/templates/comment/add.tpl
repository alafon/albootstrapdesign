{ezcss_require( 'comment.css' )}
<div class="ezcom-add-result">
  {if is_set($error_message)}
    <div class="alert-message block-message error">
        <p>
            {$error_message}
        </p>

        {if is_set( $validation_messages )}
            {foreach $validation_messages as $field => $message }
                <p><strong>{$field}:</strong><br /> {$message}</p>
            {/foreach}
        {/if}
        
        <div class="alert-actions">            
        <input type="button" onclick="history.back();" class="btn button" value="{'Back'|i18n( 'ezcomments/comment/view/action' )}" />
        </div>
    </div>
  {/if}
  {if and( is_set( $success ), $success|eq( 1 ) )}
    <div class="alert-message block-message success">
        <p>
            {'Your comment has been posted.'|i18n( 'ezcomments/comment/add' )}
        </p>
        {if is_set( $success_message )}
        <p>
            {$success_message}
        </p>
        {/if}
        <div class="alert-actions">
        <form action={'comment/add'|ezurl} method="get" name="CommentAdded">
            <input type="hidden" name="RedirectURI" value="{$redirect_uri}" />
            <input type="submit" class="btn primary button" name="BackButton" value="{'Back'|i18n( 'ezcomments/comment/action') }" />
        </form>
        </div>
    </div>
  {/if}
</div>