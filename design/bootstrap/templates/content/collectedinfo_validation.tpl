{default class='warning'}
    {if $class|eq( 'message-warning' )}
    {set $class = 'warning}
    {/if}
    {section show=and($validation.processed,$collection_attributes)}
        {section show=$validation.attributes}

    <div class="alert-message block-message {$class|wash}">
        <h2>{"Missing or invalid input"|i18n("design/standard/node/view")}</h2>
        <p>
                <ul>
                {section name=UnvalidatedAttributes loop=$validation.attributes show=$validation.attributes}
                <li>{$:item.name|wash}: {$:item.description}</li>
                {/section}
                </ul>
        </p>
    </div>

        {/section}

    {/section}
{/default}