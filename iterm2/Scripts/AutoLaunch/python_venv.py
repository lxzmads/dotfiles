#!/usr/bin/env python3

import iterm2

async def main(connection):
    python_venv_component = iterm2.StatusBarComponent(
        short_description="Python virtual environment",
        detailed_description="Show the currently active Python virtual environment",
        knobs=[
            iterm2.CheckboxKnob("Show even if unset?", False, "force"),
            iterm2.CheckboxKnob("Shorten to trailing directory?", True, "shorten"),
        ],
        exemplar="🐍3.9.2",
        update_cadence=1,
        identifier="com.livinglogic.walter.iterm.status.python-venv")

    @iterm2.StatusBarRPC
    async def python_venv_callback(
        knobs,
        python_venv=iterm2.Reference("user.python_venv?")
    ):
        if python_venv:
            if "shorten" in knobs and knobs["shorten"]:
                python_venv = python_venv.rsplit("/")[-1]
            return f"🐍\N{THIN SPACE}{python_venv}"
        elif "force" in knobs and knobs["force"]:
            return f"🐍\N{THIN SPACE}\N{TWO-EM DASH}"
        else:
            return ""

    await python_venv_component.async_register(connection, python_venv_callback)


iterm2.run_forever(main)
