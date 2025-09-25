# My (DOT) configs

Configuration files for zsh prompt, terminal, and shell environment.

## How to use

1. Download and install:

    - Starship: <https://starship.rs/>
    - Antidote: <https://antidote.sh/>

    (This assumes you have zsh installed and set as your default shell)

2. Clone this repository:

    ```sh
    git clone git@github.com:oliverfunk/.config.git "$HOME/.config"
    ```

3. Append the following line to the bottom of your `.zshrc` file to load your custom configuration:

    ```sh
    echo -e '\n. "$HOME/.config/zsh/zsh-entry.zsh"' >> ~/.zshrc
    ```

4. Restart your terminal and enjoy your new setup!
