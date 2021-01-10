**<u>One Way Data binding:</u>**

Greetings, ==@userName==
<button class="btn btn-primary" ==@onclick="ToggleName"==>Change Name</button>
@code {
    string userName = "Bradley";
    ==void ToggleName()==
    {
        if (userName == "Bradley")
            userName = "Mr. Wells";
        else
            userName = "Bradley";
    }
}

**Two way data binding:**

Greetings, ==@userName==

<input ==@bind="userName"== />

@code {
    string userName = "Bradley";
}

**Two way binding: Binding on events:**

Greetings, ==@userName==

<input ==@bind-value="userName" @bind-value:event="oninput"== />

@code {
    string userName = "Bradley";
}

```

```