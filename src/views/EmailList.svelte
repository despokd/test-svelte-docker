<script>
    import EmailItem from "../components/EmailItem.svelte";
    import isEmail from "validator/es/lib/isEmail";

    $: emails = [];
    let value = "";
    let isValid = false;
    let wasValidated = false;
    let onlyUserFriendlyEmails = false;
    let blacklistedChars = "!#$%&'*+/=?^_`{|}~";
    let minCharsLocal = 1;

    function validateEmail() {
        // valid email chars: A-Za-z0-9.!#$%&'*+-/=?^_`{|}~@example.com (https://en.wikipedia.org/wiki/Email_address#Local-part)
        isValid = isEmail(value, {
            allow_utf8_local_part: false,
            allow_ip_domain: false,
            domain_specific_validation: true,
            require_tld: true,
            blacklisted_chars: onlyUserFriendlyEmails ? blacklistedChars : "",
        });

        // require minimum length of local name, if readable emails is checked
        if (onlyUserFriendlyEmails && isValid) {
            isValid =
                value.substr(0, value.indexOf("@")).length > minCharsLocal;
        }

        wasValidated = true;
    }

    function addEmail(e) {
        // prevent default form submit
        e.preventDefault();

        // add email
        emails = [...emails, value];

        // reset input
        value = "";
        isValid = false;
        wasValidated = false;
    }

    function removeEmail(i) {
        emails = [...emails.slice(0, i), ...emails.slice(i + 1)];
    }
</script>

<h1>E-mail list</h1>
<div class="settings form-check form-switch">
    <input
        class="form-check-input"
        type="checkbox"
        id="switch"
        bind:checked={onlyUserFriendlyEmails}
        on:change={validateEmail}
    />
    <label class="form-check-label" for="switch"> Only readable e-mails </label>
    <small>
        {#if onlyUserFriendlyEmails}
            <dl>
                <dt>Not allowed chars</dt>
                <dd>{blacklistedChars}</dd>
                <dt>Minimum local name chars</dt>
                <dd>{minCharsLocal}</dd>
            </dl>
        {/if}
    </small>
</div>

<form on:submit={addEmail}>
    <label for="inputEmail" class="form-label">New e-mail</label>
    <div class="input-group mb-3">
        <!-- svelte-ignore a11y-autofocus -->
        <input
            type="text"
            id="inputEmail"
            name="inputEmail"
            class="form-control"
            class:is-invalid={!isValid && wasValidated}
            placeholder="name@example.com"
            aria-describedby="button-add"
            autofocus
            autocomplete
            bind:value
            on:input={validateEmail}
        />

        <button
            type="submit"
            id="button-add"
            class="btn btn-primary "
            disabled={!isValid}
        >
            Add
        </button>
        <div class="invalid-feedback">
            Please enter a valid {#if onlyUserFriendlyEmails}and readable
            {/if}e-mail address
        </div>
    </div>
</form>

<ul class="list-group">
    {#each emails as email, index}
        <EmailItem {email} on:remove={() => removeEmail(index)} />
    {/each}
</ul>

<style>
    form {
        margin: 2rem 0;
    }
    #button-add {
        border-top-right-radius: 0.25rem;
        border-bottom-right-radius: 0.25rem;
    }
</style>
