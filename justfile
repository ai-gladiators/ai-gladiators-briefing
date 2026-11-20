set shell := ["bash", "-uc"]
import '.cicd/workflow.just'

# Show the project banner and list the recipes.
default:
    #!/usr/bin/env bash
    set -e
    GIT_REV=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
    echo ""
    echo "==============================================================================="
    echo "                             AI Gladiators: Briefing                           "
    echo ""
    echo "       The contestant briefing: targets, rules, scoring, and referee           "
    echo ""
    echo "   Repository:  ai-gladiators/ai-gladiators-briefing                           "
    echo "   Git Version: ${GIT_REV}                                                     "
    echo "   Copyright:   AI Gladiators                                                  "
    echo "   License:     MIT (code) + CC BY 4.0 (docs)                                  "
    echo "==============================================================================="
    echo ""
    just --list
    echo ""
