#!/usr/bin/env python3.7

import iterm2
# This script was created with the "basic" environment which does not support adding dependencies
# with pip.

async def main(connection):
    knobs = []
    component = iterm2.StatusBarComponent(
        short_description="Tab Count",
        detailed_description="info the current tab index/total tab count",
        knobs=knobs,
        exemplar="1/3",
        update_cadence=1,
        identifier="io.qygo.iterm2.tab-count")
        
    @iterm2.StatusBarRPC
    async def tab_count(knobs):
        app = await iterm2.async_get_app(connection)
        window = app.current_terminal_window
        return str(window.tabs.index(window.current_tab) + 1) + " / " + str(len(window.tabs))
    await component.async_register(connection, tab_count)

iterm2.run_forever(main)
