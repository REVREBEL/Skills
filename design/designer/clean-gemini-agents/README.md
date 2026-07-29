# Clean Gemini Agents Package

This package was extracted from Gemini `write_file` JSON logs and converted into real markdown files.

## What changed

- Removed Gemini JSON wrapper files.
- Preserved the generated agent and skill markdown content.
- Broke skills into proper folders using `SKILL.md` files.
- Kept agents under `gemini-agents/agents/<agent-name>/<agent-name>.agent.md`.
- Added this README plus a manifest for traceability.

## Agent files

- **Documentation Agent** — Generates professional project documentation, including technical docs, README files, API docs, diagrams, and walkthroughs. Automatically discovers any project''s technology stack, architecture, and code structure.  
  `gemini-agents/agents/documentation-agent/documentation-agent.agent.md`
- **Implementation Agent** — Expert in modern software development, specializing in React 19.2, TypeScript, and performance optimization. This agent is responsible for code task planning, front-end and back-end implementation, component buildout, and migration execution.  
  `gemini-agents/agents/implementation-agent/implementation-agent.agent.md`
- **System Orchestrator** — "The team lead: Orchestrates planning, implementation, and verification of the Gemini Agent System."  
  `gemini-agents/agents/system-orchestrator/system-orchestrator.agent.md`
- **Technical Architecture Agent** — Holistic software architecture planner that evaluates tech stacks, designs scalability roadmaps, performs cloud-agnostic cost analysis, reviews existing codebases, and delivers interactive Mermaid diagrams with HTML preview and draw.io export.  
  `gemini-agents/agents/technical-architecture-agent/technical-architecture-agent.agent.md`
- **UX Interface Agent** — UI/UX design specialist — layouts, themes, color schemes, design systems, accessibility.  
  `gemini-agents/agents/ux-interface-agent/ux-interface-agent.agent.md`

## Skill files

- **agent-to-agent** — Agent-to-Agent (A2A) communication protocol. Connect two or more Claude agents that pass messages, share context, delegate tasks, and collaborate. Implements structured handoffs, shared memory, and multi-agent conversations.  
  `gemini-agents/skills/agent-to-agent/agent-to-agent/SKILL.md`
- **brand-consistency-checker** — Scan documents and slides for off-brand colors, fonts, and logos. Validate against brand guidelines and suggest corrections.  
  `gemini-agents/skills/branding/brand-consistency-checker/SKILL.md`
- **brand-voice-analyzer** — Analyzes a company's content to extract and codify their brand voice into a comprehensive style guide. Reads website copy, blog posts, emails, and social media to identify tone, vocabulary patterns, sentence structure, personality traits, and word preferences. Generates a brand-voice-guide.md and reviews new content against it.  
  `gemini-agents/skills/branding/brand-voice-analyzer/SKILL.md`
- **customer-journey-mapper** — Maps the full customer journey from first touch to advocacy. Generates a comprehensive customer-journey.md with all stages, touchpoints, emotions, pain points, opportunities, Mermaid diagrams, and metrics. Use when mapping customer experience, designing onboarding flows, identifying churn risks, or optimizing conversion funnels.  
  `gemini-agents/skills/customer-journey/customer-journey-mapper/SKILL.md`
- **design-system-architect** — "Design system architect: token hierarchies, theming strategies, component library design, Figma-to-code pipelines, and design governance."  
  `gemini-agents/skills/technical-architecture/design-system-architect/SKILL.md`
- **design-system-patterns** — Build scalable design systems with design tokens, theming infrastructure, and component architecture patterns. Use when creating design tokens, implementing theme switching, building component libraries, or establishing design system foundations.  
  `gemini-agents/skills/technical-architecture/design-system-patterns/SKILL.md`
- **interaction-design** — Design and implement microinteractions, motion design, transitions, and user feedback patterns. Use when adding polish to UI interactions, implementing loading states, or creating delightful user experiences.  
  `gemini-agents/skills/ux-design/interaction-design/SKILL.md`
- **responsive-design** — Implement modern responsive layouts using container queries, fluid typography, CSS Grid, and mobile-first breakpoint strategies. Use when building adaptive interfaces, implementing fluid layouts, or creating component-level responsive behavior.  
  `gemini-agents/skills/ux-design/responsive-design/SKILL.md`
- **visual-design-foundations** — Apply typography, color theory, spacing systems, and iconography principles to create cohesive visual designs. Use when establishing design tokens, building style guides, or improving visual hierarchy and consistency.  
  `gemini-agents/skills/ux-design/visual-design-foundations/SKILL.md`
- **web-component-design** — Master React, Vue, and Svelte component patterns including CSS-in-JS, composition strategies, and reusable component architecture. Use when building UI component libraries, designing component APIs, or implementing frontend design systems.  
  `gemini-agents/skills/ux-design/web-component-design/SKILL.md`


## Recommended active structure

```text
gemini-agents/
  agents/
    system-orchestrator/
    technical-architecture-agent/
    ux-interface-agent/
    implementation-agent/
    documentation-agent/
  skills/
    agent-to-agent/
    branding/
    customer-journey/
    technical-architecture/
    ux-design/
```

## Suggested next cleanup pass

The extracted files are now usable, but there is still conceptual overlap in the design-system skills:

- `design-system-architect`
- `design-system-patterns`
- `visual-design-foundations`
- `web-component-design`

Recommended merge direction:

- Keep `design-system-architect` as the high-level system/governance skill.
- Keep `design-system-patterns` only if it remains tactical and implementation-oriented.
- Keep `visual-design-foundations` for visual language.
- Keep `web-component-design` for component API and implementation patterns.

Do not let all four skills own “design system strategy.” Only one should own strategy.
