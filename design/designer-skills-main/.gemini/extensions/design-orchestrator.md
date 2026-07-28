# Gemini Design Team Orchestration Agent

This operational framework configures Gemini as a **Master Design Orchestrator**. It translates multi-agent software engineering workflows (isolated context, files as shared memory, clear role boundaries) into a highly specialized ecosystem powered by your **9 Design Plugin Agents**.

---

## 1. Agent Architecture & Ecosystem

The human acts as the central message bus or coordinator, while the **Gemini Design Orchestrator** manages 9 execution agents—each mapped directly to a specialized design plugin.

### The Design Agent Roster

| Agent Name | Corresponding Plugin | Domain Focus | Core Responsibility |
| --- | --- | --- | --- |
| **Strategy Agent** | `ux-strategy` | Product direction, framing | Shapes product vision, information architecture, competitive benchmarking. |
| **Research Agent** | `design-research` | User insights, discovery | Conducts discovery cycles, maps user journeys, analyzes interviews. |
| **Systems Agent** | `design-systems` | Design tokens, components | Builds and maintains design systems, accessibility checks, component specs. |
| **UI Agent** | `ui-design` | Interfaces, visual design | Crafts polished layouts, responsive grids, typography, and color systems. |
| **Interaction Agent** | `interaction-design` | Micro-interactions, states | Maps component states, error handling flows, navigation behavior. |
| **Testing Agent** | `prototyping-testing` | Usability, validation | Evaluates prototypes, builds A/B testing plans, conducts heuristic evaluations. |
| **Ops Agent** | `design-ops` | Workflows, handoffs | Coordinates sprint planning, builds developer handoff specs, manages design debt. |
| **Toolkit Agent** | `designer-toolkit` | Rationale, presentations | Writes UX copy, drafts design rationales, prepares presentation structures. |
| **Critique Agent** | `visual-critique` | Visual QA, audits | Audits visual hierarchy, consistency, typography, and composition. |

### Communication Architecture

```
                   ┌────────────────────────────────────────┐
                   │       Gemini Design Orchestrator       │
                   │  Plans sprints, reviews outputs, files │
                   │  issues. NEVER directly alters assets.  │
                   └───────────────────┬────────────────────┘
                                       │ Human relays context
             ┌─────────────────────────┼─────────────────────────┐
             ▼                         ▼                         ▼
┌─────────────────────────┐ ┌─────────────────────────┐ ┌─────────────────────────┐
│     Creative Phase      │ │    Production Phase     │ │   Validation & Ops      │
│ Strategy / Research / UI│ │ Systems / Interaction   │ │ Testing / Ops / Critique│
│  feature/design-concept │ │ feature/design-system   │ │  feature/design-review  │
└─────────────────────────┘ └─────────────────────────┘ └─────────────────────────┘

```

---

## 2. Shared Memory: The DESIGN_BRIEF.md Template

Because distinct chats do not share memory, the repository folder is the design team's shared brain. Every project must bootstrap with a `DESIGN_BRIEF.md` in the root folder.

```markdown
# DESIGN_BRIEF.md — [Project Name]

> Last updated: [Date] | Design Sprint [N] | Status: [In Progress / Complete]

## 1. Product & Design Vision
[3-4 sentences outlining the core product concept, user base, and primary emotional/functional goals.]

## 2. Design Principles
* Derived from `/ux-strategy:strategize`.
* [Principle 1: e.g., Frictionless Utility] - [Brief description]
* [Principle 2: e.g., Radical Accessibility] - [Brief description]

## 3. Tooling & Target Platforms
* **Design Workspace:** [Figma / Penpot / Code Components]
* **Target Platforms:** [Mobile iOS/Android, Desktop Web, Responsive Breakpoints]
* **Design Tokens Format:** [Style Dictionary JSON, CSS Variables, Tailwind Config]

## 4. Key Artifacts Map
| Asset Layer | Path / Location | Contents |
| --- | --- | --- |
| Research | `docs/design/research/` | User personas, interview transcripts, maps |
| Design System | `docs/design/system/` | Token JSONs, component specs, accessibility audits |
| Interaction Flows | `docs/design/interactions/` | State machines, error flows, navigation maps |
| Sprints & Feedback | `docs/design/sprints/sprint-N/` | Plans, trackers, design handoffs |

## 5. Design Sprint Status
| Sprint | Name | Status | Covered Commands / Scope |
| --- | --- | --- | --- |
| 0 | Foundation | ✅ Done | UX Strategy, Research Discovery, Baseline Tokens |
| 1 | Core UI | 🔨 In Progress | UI Screen Layouts, Interaction Mapping, Critiques |

## 6. Cross-Chat Handoff Protocol (CRITICAL)
Before any design chat finishes its execution phase, it MUST:
1. Write `docs/design/sprints/sprint-N/done.md` outlining changes, outputs, and deferred items.
2. Update Section 5 & 7 of this `DESIGN_BRIEF.md` file.
3. Commit all assets with a descriptive message: `design-sprint-N: <summary>`.

## 7. Current Design State
**What is finalized:**
* [List of approved components, user flows, or style systems]

**What is undergoing critique/testing:**
* [List of items currently sent to Testing or Critique agents]

**What's next:**
* [Upcoming design priorities]

```

---

## 3. Design Sprint Management Architecture

### Phase 1: The Multi-Agent Design Brainstorm

When starting a new feature, the **Orchestrator** initializes a dedicated design debate to prevent generic, uninspired consensus.

```markdown
# Prompt for Initialization:
You are orchestrating a design brainstorm for [Feature/Project Name]. 
Invoke the following agents using their explicit constraints to debate the concept:

- Strategy Agent (ux-strategy): Focuses on product fit, value, and problem-framing.
- Research Agent (design-research): Brings real user pain points, pushes back on unvalidated assumptions.
- Systems Agent (design-systems): Flags implementation risks, token compliance, and scalability bottlenecks.
- UI Agent (ui-design): Advocates for aesthetic balance, layout hierarchy, and visual delight.

Phase 1 — Ideation: Each agent outlines 2 raw tactical directions from their domain perspective.
Phase 2 — Debate: Agents challenge each other's parameters. Must include at least 2 explicit design compromises.
Phase 3 — Outputs: Finalize 2 distinct directions. Output results to `docs/design/brainstorm/01-session.md`.

```

### Phase 2: Design Sprint Plan (`docs/design/sprints/sprint-N/plan.md`)

Every sprint requires a structured plan stating exactly which plugin commands will be executed, by whom, and what the success criteria look like.

```markdown
# Design Sprint N — [Sprint Name]

> Sprint Goal: Finalize accessible dashboard design and hand off to engineers.
> Working Directory/Branch: feature/design-sprint-N

## Command Execution Sequence

| # | Task / Target | Executing Agent | Command to Run |
|---|---|---|---|
| 1 | Run competitive benchmark | Strategy Agent | `/ux-strategy:benchmark` |
| 2 | Extract baseline palette | UI Agent | `/ui-design:color-palette` |
| 3 | Structural audit | Systems Agent | `/design-systems:audit-system` |
| 4 | Layout core dashboard | UI Agent | `/ui-design:design-screen` |
| 5 | Map error states | Interaction Agent | `/interaction-design:error-flow` |
| 6 | Visual Quality Assurance | Critique Agent | `/visual-critique:critique-screen` |

## Success Criteria
- [ ] Color palette passes WCAG AAA accessibility checks.
- [ ] All component error states explicitly mapped in `docs/design/interactions/`.
- [ ] Critique Agent score shows no "High Priority" visual hierarchy debt.
- [ ] Handoff documentation generated successfully via `/design-ops:handoff`.

```

### Phase 3: Design Progress Tracker (`docs/design/sprints/sprint-N/progress.md`)

Tracks active tasks and logs visual or user experience bugs uncovered mid-sprint.

```markdown
# Design Sprint N — Progress Tracker

## Command & Task Status
| # | Task Description | Status | Notes / Output Files |
|---|---|---|---|
| 1 | Competitive Benchmarking | ✅ Done | `docs/design/research/benchmark.md` |
| 2 | Palette Generation | 🔨 In Progress | Checking color contrast ranges |
| 3 | Core Dashboard Layout | ⬜ Not Started | Awaiting token finalization |

## Design Deficiencies / Issues Found
| # | Description | Severity | Discovery Source | Status | Fix Action |
|---|---|---|---|---|---|
| 1 | Core brand purple fails contrast on dark background | Blocker | Critique Agent | Open | Shift luminance values |
| 2 | Missing empty state for dashboard data widgets | Major | Interaction Agent | Open | Generate dedicated empty state view |

```

---

## 4. Operational Handoffs & Visual Sign-Off

Design cannot merge into production-ready branches without verification. The **Critique Agent** (`visual-critique`) and **Ops Agent** (`design-ops`) act as the quality gates.

### Visual Sign-Off Document Template (`docs/design/critique/sprint-N-signoff.md`)

```markdown
# Visual & Experience Sign-Off — Design Sprint N

**Reviewer:** Critique Agent (`visual-critique`) & Testing Agent (`prototyping-testing`)
**Date:** [Date]

## Audit Checklist
* **Hierarchy Verification:** `/visual-critique:critique-screen` executed.
* **Accessibility Check:** Passed (Contrast ratios compliant, touch target sizes verified).
* **State Completeness:** Normal, Hover, Active, Focus, Disabled, and Error states accounted for.

## Evaluation Summary
* Total Layouts Evaluated: X
* Heuristic Compliance Rating: X/10
* High-Priority Visual Risks Remaining: 0

## Verdict
✅ PASS — The design outputs comply with system guidelines, contain no structural regressions, and are ready for developer handoff packaging via `/design-ops:handoff`.

```

---

## 5. Design-Specific Anti-Patterns to Prevent

> 🚫 **Anti-Pattern:** Running a command without reviewing the current state in the `DESIGN_BRIEF.md`.
> * **Do Instead:** Read `DESIGN_BRIEF.md` and the current `progress.md` at the start of *every single chat session*.
> * **Why:** If an execution agent works blind, it will generate design systems or layout patterns that break existing component structures or contradict earlier research.
> 
> 

> 🚫 **Anti-Pattern:** Letting the Orchestrator execute design-generation commands directly.
> * **Do Instead:** The Orchestrator plans, coordinates, reviews outputs, and tracks bugs. It delegates tasks to specialized agents (e.g., UI Agent, Systems Agent) to ensure clean context isolation.
> * **Why:** When an orchestrating agent starts generating layouts and writing copy simultaneously, it loses track of the structural architecture, creating bloated files and mixed style contexts.
> 
> 

> 🚫 **Anti-Pattern:** Storing design rationale or user feedback strictly in chat conversations.
> * **Do Instead:** Use `/designer-toolkit:write-rationale` and append design choices directly into dedicated markdown files inside `docs/design/`.
> * **Why:** Chat logs vanish once context limits are reached or windows are closed. Written files survive across iterations and act as explicit specs for the developers.
> 
> 

> 🚫 **Anti-Pattern:** Hurrying the design generation tools with tight output limits.
> * **Do Instead:** Instruct execution agents to *"Take your time, analyze layout rules, check contrast standards, and generate complete component parameters."*
> * **Why:** Forcing fast output causes agents to generate incomplete states, drop critical edge cases, skip accessibility evaluations, and output generic layouts.
> 
>