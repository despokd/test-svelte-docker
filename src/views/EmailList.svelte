<script>
    import EmailItem from "../components/EmailItem.svelte";

    $: emails = [];
    let value = "";
    let isValid = false;
    let wasValidated = false;

    function validateEmail() {
        const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        isValid = re.test(String(value).toLowerCase());
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

    function deleteEmail(i) {
        // TODO
        // delete emails[i];
        //emails = emails;
        emails = [...emails.slice(0, i), ...emails.slice(i + 1)];
    }
</script>

<h1>E-mail list</h1>
<form on:submit={addEmail}>
    <label for="inputEmail" class="form-label">New e-mail</label>
    <div class="input-group mb-3">
        <input
            type="text"
            id="inputEmail"
            name="inputEmail"
            class="form-control"
            class:is-invalid={!isValid && wasValidated}
            placeholder="name@example.com"
            aria-describedby="button-add"
            bind:value
            on:input={validateEmail}
        />

        <button
            type="submit"
            id="button-add"
            class="btn btn-primary"
            disabled={!isValid}>Add to list</button
        >
        <div class="invalid-feedback">Please enter a valid e-mail address</div>
    </div>
</form>

<ul class="list-group">
    {#each emails as email, index}
        <EmailItem {email} on:remove={() => deleteEmail(index)} />
    {/each}
</ul>

<style>
    form {
        margin: 2rem 0;
    }
    .input-group button.btn.btn-primary {
        border-top-right-radius: 0.25rem;
        border-bottom-right-radius: 0.25rem;
    }
</style>