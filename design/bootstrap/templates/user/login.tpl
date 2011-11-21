<form method="post" action={"/user/login/"|ezurl} name="loginform">

<div class="page-header">
    <h1 class="">{"Login"|i18n("design/ezwebin/user/login")}</h1>
</div>

{if $User:warning.bad_login}
<div class="alert-message error">
<p>{"Could not login"|i18n("design/ezwebin/user/login")}</p>
<p>{"A valid username and password is required to login."|i18n("design/ezwebin/user/login")}</p>
</div>
{else}

{if $site_access.allowed|not}
<div class="alert-message warning">
<p>{"Access not allowed"|i18n("design/ezwebin/user/login")}</p>
<p>{"You are not allowed to access %1."|i18n("design/ezwebin/user/login",,array($site_access.name))}</p>
</div>
{/if}

{/if}

<div class="clearfix">
<label for="id1">{"Username"|i18n("design/ezwebin/user/login",'User name')}</label><div class="labelbreak"></div>
<div class="input">
<input class="halfbox" type="text" size="10" name="Login" id="id1" value="{$User:login|wash}" tabindex="1" />
</div>
</div>

<div class="clearfix">
<label for="id2">{"Password"|i18n("design/ezwebin/user/login")}</label><div class="labelbreak"></div>
<div class="input">
<input class="halfbox" type="password" size="10" name="Password" id="id2" value="" tabindex="1" />
</div>
</div>
{if ezini( 'SiteSettings', 'AdditionalLoginFormActionURL' )}
<div class="clearfix">
<label for="id3">{"Log in to the eZ Publish Administration Interface"|i18n("design/ezwebin/user/login")}</label><div class="labelbreak"></div>
<div class="input">
<input type="checkbox" size="10" name="AdminSiteaccessURI" id="id3" value="" tabindex="1" onclick="AdminSiteaccessCheckbox(this);" />
</div>
</div>

{*
    Set URL for login form action
    site.ini.[SiteSettings].AdditionalLoginFormActionURL
    If empty then checkbox will not appear
*}
<script type="text/javascript">
<!--

var loginForm = document.loginform;
var loginFormDefaultAction = loginForm.action;

function AdminSiteaccessCheckbox( val )
{ldelim}

    if( val.checked )
        loginForm.action = '{ezini( 'SiteSettings', 'AdditionalLoginFormActionURL' )}';
    else
        loginForm.action = loginFormDefaultAction;

{rdelim}

-->
</script>
{/if}
{if ezini( 'Session', 'RememberMeTimeout' )}
<div class="clearfix">
<div class="input">
<input type="checkbox" tabindex="1" name="Cookie" id="id4" /><label for="id4" style="display:inline;">{"Remember me"|i18n("design/ezwebin/user/login")}</label>
</div>
</div>
{/if}

<div class="actions">
<input class="btn primary" type="submit" name="LoginButton" value="{'Login'|i18n('design/ezwebin/user/login','Button')}" tabindex="1" />
{if ezmodule( 'user/register' )}
    <input class="btn default" type="submit" name="RegisterButton" id="RegisterButton" value="{'Sign up'|i18n('design/ezwebin/user/login','Button')}" tabindex="1" />
{/if}
</div>

{if ezini( 'SiteSettings', 'LoginPage' )|eq( 'custom' )}
    <p><a href={'/user/forgotpassword'|ezurl}>{'Forgot your password?'|i18n( 'design/ezwebin/user/login' )}</a></p>
{/if}

<input type="hidden" name="RedirectURI" value="{$User:redirect_uri|wash}" />

{if and( is_set( $User:post_data ), is_array( $User:post_data ) )}
  {foreach $User:post_data as $key => $postData}
     <input name="Last_{$key}" value="{$postData}" type="hidden" /><br/>
  {/foreach}
{/if}

</form>