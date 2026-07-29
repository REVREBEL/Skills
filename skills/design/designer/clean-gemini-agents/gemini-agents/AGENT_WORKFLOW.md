# Agent Workflow Guide

## Purpose

Use this package as a cleaned agent/skill foundation for a guest messaging platform and curated guest landing page build.

## Recommended operating model

1. **System Orchestrator** receives the user request, clarifies scope, chooses agents, and manages handoffs.
2. **Technical Architecture Agent** defines architecture, data model, API boundaries, integration strategy, and scalability constraints.
3. **UX Interface Agent** defines the guest-facing flow, interface structure, visual hierarchy, accessibility, and responsive behavior.
4. **Implementation Agent** builds or edits code once architecture and UX direction are clear.
5. **Documentation Agent** records decisions, API contracts, setup instructions, and handoff notes.

## Skill ownership

- `agent-to-agent`: shared by all agents; required for handoffs.
- `customer-journey-mapper`: primarily used by UX Interface Agent and System Orchestrator.
- `brand-voice-analyzer`: used by UX Interface Agent and Documentation Agent.
- `brand-consistency-checker`: used during review and documentation.
- `design-system-architect`: used by Technical Architecture Agent and UX Interface Agent.
- `design-system-patterns`: used by UX Interface Agent and Implementation Agent.
- `responsive-design`: used by UX Interface Agent and Implementation Agent.
- `visual-design-foundations`: used by UX Interface Agent.
- `interaction-design`: used by UX Interface Agent and Implementation Agent.
- `web-component-design`: used by Implementation Agent.

## Handoff minimum

Every handoff should include:

- Objective
- Current state
- Files touched or expected
- Constraints
- Decisions already made
- Open questions
- Acceptance criteria
- Next agent requested

## Avoided failure mode

Do not let multiple agents independently plan the same thing. The System Orchestrator owns routing; each specialist owns only its domain.
