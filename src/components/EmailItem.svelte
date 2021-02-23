<script>
    import { createEventDispatcher } from "svelte";

    export let email = "Empty";

    const dispatch = createEventDispatcher();
    const remove = () => dispatch("remove");
</script>

<li class="list-group-item">
    {email}<span class="actions"
        ><button class="btn btn-danger btn-sm" on:click={remove}>Delete</button
        ></span
    >
</li>

<style>
    @media (prefers-color-scheme: dark) {
        li {
            color: #121212;
        }
    }
    li {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .actions {
        float: right;
    }
</style>
