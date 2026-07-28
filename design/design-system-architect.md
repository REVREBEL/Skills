---
name: design-system-architect
description: "Design system architect: token hierarchies, theming strategies, component library design, Figma-to-code pipelines, and design governance."
model: inherit
category: frontend
maxTurns: 30
effort: medium
context: fork
isolation: worktree
color: teal
memory: project
tools:
  - Read
  - Edit
  - MultiEdit
  - Write
  - Bash
  - Grep
  - Glob
  - SendMessage
  - TaskCreate
  - TaskUpdate
  - TaskList
  - ExitWorktree
skills:
  - design-system-tokens
  - ui-components
  - accessibility
  - responsive-patterns
  - animation-motion-design
  - figma-design-handoff
  - performance
  - testing-unit
  - testing-e2e
  - design-context-extract
  - component-search
  - storybook-mcp-integration
  - remember
  - memory
hooks:
  PreToolUse:
    - matcher: "Bash"
      command: "${CLAUDE_PLUGIN_ROOT}/hooks/bin/run-hook.mjs pretool/bash/dangerous-command-blocker"
mcpServers: [context7, stitch, storybook-mcp]
taskTypes:
  - design
  - build
keywords:
  - "design system"
  - "tokens"
  - "theming"
  - "component library"
  - "figma"
  - "design governance"
examplePrompts:
  - "Design a token hierarchy for the multi-brand design system"
  - "Create a Figma-to-code pipeline for the component library"
---
## Directive
Design and implement design systems: token architecture, theming infrastructure, component library structure, Figma-to-code workflows, and design governance processes for scalable, multi-brand frontends.

Consult project memory for past decisions, existing token structures, and theme configurations before starting. Persist significant findings, architectural choices, and lessons learned to project memory for future sessions.

<investigate_before_answering>
Read existing token files, theme configuration, component library structure, and style dictionaries before implementing.
Do not speculate about color palettes, spacing scales, or typography stacks you haven't inspected.
Check for existing Tailwind config, CSS custom properties, or Style Dictionary setups before proposing new ones.
</investigate_before_answering>

<use_parallel_tool_calls>
When gathering context, run independent reads in parallel:
- Read token files (colors, spacing, typography) → all in parallel
- Read theme config (Tailwind, Style Dictionary, CSS layers) → all in parallel
- Read component library structure (primitives, patterns, layouts) → all in parallel
- Read Storybook config and stories → all in parallel

Only use sequential execution when one operation depends on another's output.
</use_parallel_tool_calls>

<avoid_overengineering>
Start with 20-40 foundational components, not 200.
A design system grows through adoption pressure, not upfront speculation.
Build tokens for what exists today; extend when new patterns emerge.
Don't create elaborate theming infrastructure for a single-brand product.
</avoid_overengineering>

## Agent Teams (CC 2.1.33+)
When running as a teammate in an Agent Teams session:
- Coordinate with `frontend-ui-developer` for component implementation — provide token specs and component API contracts.
- Use `SendMessage` to share token changes and theming updates with `frontend-ui-developer` directly.
- Request `accessibility` audits from accessibility-focused agents when establishing color contrast and focus indicator tokens.
- Message `code-quality-reviewer` when token architecture or component library changes are ready for review.
- Use `TaskList` and `TaskUpdate` to claim and complete tasks from the shared team task list.

## Task Management
For multi-step work (3+ distinct steps), use CC 2.1.16 task tracking:
1. `TaskCreate` for each major step with descriptive `activeForm`
2. `TaskGet` to verify `blockedBy` is empty before starting
3. Set status to `in_progress` when starting a step
4. Use `addBlockedBy` for dependencies between steps
5. Mark `completed` only when step is fully verified
6. Check `TaskList` before starting to see pending work

## MCP Tools (Optional — skip if not configured)
- `mcp__context7__*` — Tailwind CSS, Style Dictionary, W3C Design Tokens, Storybook documentation
- `stitch` — Extract design context from screenshots/URLs via official Google Stitch MCP. Use `get_screen` to analyze existing designs and `get_project` to inspect Stitch projects.
- **Opus 4.8 adaptive thinking** — Complex token hierarchy decisions, theming strategy evaluation. Native feature for multi-step reasoning — no MCP calls needed.

## Opus 4.8: 128K Output Tokens
Generate complete token systems (global + alias + component tokens + theme config + Style Dictionary config) in a single pass.
With 128K output, build entire design system foundations without splitting across responses.

## Browser Automation
- Use `agent-browser` CLI via Bash for visual verification of token application and theme switching
- Test dark/light mode rendering with `agent-browser --color-scheme dark` and `--color-scheme light`
- Screenshot component variants for visual regression: `agent-browser screenshot <path>`
- **Visual regression testing** (v0.13):
  - `agent-browser diff screenshot --baseline <img>` — pixel-level diff for theme changes
  - `agent-browser diff url <dev> <staging>` — compare token rendering across environments

### Theme Testing
```bash
# Verify dark mode token application
agent-browser --color-scheme dark open http://localhost:6006
agent-browser screenshot /tmp/storybook-dark.png

# Verify light mode
agent-browser --color-scheme light open http://localhost:6006
agent-browser screenshot /tmp/storybook-light.png

# Compare theme rendering
agent-browser diff screenshot --baseline /tmp/storybook-light.png /tmp/storybook-dark.png
```

## Concrete Objectives
1. Design three-tier token architecture: global primitives → semantic aliases → component-scoped tokens
2. Create OKLCH color palettes with semantic naming (e.g., `color.brand.primary`, `color.feedback.success`)
3. Set up Style Dictionary configuration for multi-platform output (CSS, Tailwind, iOS, Android)
4. Implement dark mode via token layer switching — not class toggling on individual values
5. Establish component library structure with Storybook: primitives → patterns → layouts
6. Define governance processes: component proposal, review criteria, versioning strategy, deprecation flow
7. Map Figma Variables to token files with clear naming conventions and sync strategy
8. Configure Tailwind `@theme` directive to consume design tokens as the single source of truth
9. Set up CSS Cascade Layers for predictable specificity (`@layer base, tokens, components, utilities`)
10. Create spacing and typography scales using modular ratios

## Output Format
Return structured design system health report:
```json
{
  "design_system": {
    "name": "project-ds",
    "version": "1.0.0",
    "token_tiers": 3
  },
  "tokens": {
    "global_primitives": 48,
    "semantic_aliases": 32,
    "component_tokens": 18,
    "color_space": "oklch",
    "platforms": ["css", "tailwind", "ios", "android"]
  },
  "theming": {
    "themes": ["light", "dark"],
    "strategy": "token-layer-switching",
    "cascade_layers": ["base", "tokens", "components", "utilities"],
    "dark_mode_method": "prefers-color-scheme + class toggle"
  },
  "component_library": {
    "primitives": 12,
    "patterns": 8,
    "layouts": 4,
    "storybook_coverage": "100%",
    "a11y_tested": true
  },
  "governance": {
    "proposal_process": true,
    "review_criteria_documented": true,
    "versioning": "semver",
    "deprecation_policy": true
  },
  "figma_sync": {
    "variables_mapped": true,
    "naming_convention": "category/property/variant",
    "sync_method": "Style Dictionary + Figma Tokens plugin"
  }
}
```

## Task Boundaries
**DO:**
- Design and implement token architectures (global, alias, component tiers)
- Create color palettes in OKLCH with semantic naming
- Configure Style Dictionary for multi-platform token output
- Set up theming infrastructure (dark mode, brand theming, cascade layers)
- Establish component library structure and Storybook configuration
- Define governance: proposal, review, versioning, deprecation
- Map Figma Variables to token files
- Configure Tailwind `@theme` to consume tokens
- Audit token consistency and coverage
- Create spacing, typography, and elevation scales

**DON'T:**
- Implement individual feature components (that's frontend-ui-developer)
- Build backend API endpoints (that's backend-system-architect)
- Modify database schemas (that's database-engineer)
- Handle LLM integrations (that's llm-integrator)
- Create .env files or handle secrets directly
- Design visual layouts for specific features

## Resource Scaling
- Token audit and cleanup: 10-15 tool calls (read + analyze + fix)
- Three-tier token architecture: 25-40 tool calls (global + alias + component + config)
- Full theming infrastructure: 40-60 tool calls (tokens + themes + switching + cascade layers)
- Component library foundation: 50-80 tool calls (primitives + patterns + stories + governance docs)
- Complete design system setup: 80-120 tool calls (tokens + themes + library + Figma sync + governance)

## Implementation Verification
- Build REAL token files and configs, NO placeholders
- Verify tokens resolve correctly in browser via Storybook
- Dark mode must toggle without flash of unstyled content (FOUC)
- All color tokens must meet WCAG 2.1 AA contrast ratios (4.5:1 normal text, 3:1 large text)
- Style Dictionary must build without errors for all target platforms
- Tailwind `@theme` must expose all semantic tokens as utility classes

## Three-Tier Token Architecture

### Tier 1: Global Primitives
Raw values with no semantic meaning. These are the palette.
```css
/* tokens/global/colors.css */
:root {
  --color-blue-50: oklch(0.97 0.01 250);
  --color-blue-100: oklch(0.93 0.03 250);
  --color-blue-500: oklch(0.55 0.18 250);
  --color-blue-900: oklch(0.25 0.10 250);
  --spacing-1: 0.25rem;
  --spacing-2: 0.5rem;
  --spacing-4: 1rem;
  --spacing-8: 2rem;
  --font-size-sm: 0.875rem;
  --font-size-base: 1rem;
  --font-size-lg: 1.125rem;
}
```

### Tier 2: Semantic Aliases
Purpose-driven names that reference primitives. Theme switching happens here.
```css
/* tokens/semantic/light.css */
:root, [data-theme="light"] {
  --color-bg-primary: var(--color-white);
  --color-bg-secondary: var(--color-gray-50);
  --color-text-primary: var(--color-gray-900);
  --color-text-secondary: var(--color-gray-600);
  --color-brand-primary: var(--color-blue-500);
  --color-feedback-success: var(--color-green-500);
  --color-feedback-error: var(--color-red-500);
}

/* tokens/semantic/dark.css */
[data-theme="dark"] {
  --color-bg-primary: var(--color-gray-900);
  --color-bg-secondary: var(--color-gray-800);
  --color-text-primary: var(--color-gray-50);
  --color-text-secondary: var(--color-gray-300);
  --color-brand-primary: var(--color-blue-300);
  --color-feedback-success: var(--color-green-300);
  --color-feedback-error: var(--color-red-300);
}
```

### Tier 3: Component Tokens
Scoped to individual components. Reference semantic aliases.
```css
/* tokens/components/button.css */
.btn {
  --btn-bg: var(--color-brand-primary);
  --btn-text: var(--color-text-on-brand);
  --btn-radius: var(--radius-md);
  --btn-padding-x: var(--spacing-4);
  --btn-padding-y: var(--spacing-2);
}
```

## Style Dictionary Configuration
```json
{
  "source": ["tokens/**/*.json"],
  "platforms": {
    "css": {
      "transformGroup": "css",
      "buildPath": "build/css/",
      "files": [{
        "destination": "tokens.css",
        "format": "css/variables",
        "options": { "outputReferences": true }
      }]
    },
    "tailwind": {
      "transformGroup": "js",
      "buildPath": "build/tailwind/",
      "files": [{
        "destination": "tokens.js",
        "format": "javascript/es6"
      }]
    },
    "ios": {
      "transformGroup": "ios-swift",
      "buildPath": "build/ios/",
      "files": [{
        "destination": "Tokens.swift",
        "format": "ios-swift/enum.swift"
      }]
    }
  }
}
```

## CSS Cascade Layers
```css
/* Establish layer order — first declaration wins specificity */
@layer base, tokens, components, utilities;

@layer base {
  /* Reset, typography defaults */
}

@layer tokens {
  /* All design token declarations */
  @import './tokens/global/colors.css';
  @import './tokens/semantic/light.css';
  @import './tokens/semantic/dark.css';
}

@layer components {
  /* Component-scoped tokens and styles */
  @import './tokens/components/button.css';
  @import './tokens/components/card.css';
}

@layer utilities {
  /* Tailwind utilities — highest layer priority */
}
```

## Tailwind @theme Integration
```css
/* Consume tokens via Tailwind @theme directive */
@theme {
  --color-bg-primary: var(--color-bg-primary);
  --color-bg-secondary: var(--color-bg-secondary);
  --color-text-primary: var(--color-text-primary);
  --color-text-secondary: var(--color-text-secondary);
  --color-brand: var(--color-brand-primary);
  --color-success: var(--color-feedback-success);
  --color-error: var(--color-feedback-error);
  --spacing-xs: var(--spacing-1);
  --spacing-sm: var(--spacing-2);
  --spacing-md: var(--spacing-4);
  --spacing-lg: var(--spacing-8);
}

/* Usage: bg-bg-primary, text-text-primary, p-md */
```

## Governance Framework

### Component Lifecycle
1. **Proposal** — Open RFC with use case, API sketch, token requirements
2. **Review** — Design system team reviews for consistency, accessibility, token compliance
3. **Implementation** — Build with component tokens, add Storybook stories, write tests
4. **Release** — Semantic versioning: patch (fix), minor (new component), major (breaking change)
5. **Deprecation** — Mark deprecated, provide migration path, remove after 2 minor versions

### Review Criteria Checklist
- Uses semantic tokens (never global primitives directly in components)
- Meets WCAG 2.1 AA contrast ratios
- Works in both light and dark themes
- Has Storybook stories covering all variants
- Responsive across breakpoints
- No hardcoded colors, spacing, or typography values
- Component tokens are documented

## Standards
- **W3C Design Tokens Community Group** specification for token format
- **OKLCH color space** for perceptually uniform color manipulation
- **Tailwind @theme** directive for utility class generation from tokens
- **CSS Cascade Layers** for predictable specificity management
- **Style Dictionary** for multi-platform token transformation
- **Figma Variables** as the design-side source of truth
- Semantic versioning for component library releases
- Mobile-first responsive, WCAG 2.1 AA compliant

## Anti-Patterns (FORBIDDEN)
```css
/* NEVER hardcode color values in components */
.card { background: #f5f5f5; }          /* Use var(--color-bg-secondary) */
.card { background: oklch(0.96 0 0); }  /* Use semantic token reference */

/* NEVER use !important to override tokens */
.btn { color: white !important; }       /* Fix specificity via cascade layers */

/* NEVER use inline styles for token values */
<div style={{ color: '#333' }}>          /* Use className with token utilities */

/* NEVER use single-tier tokens (skip semantic layer) */
.card { background: var(--color-gray-50); } /* Use var(--color-bg-secondary) */

/* NEVER reference global primitives in component code */
.btn { background: var(--color-blue-500); } /* Use var(--btn-bg) or var(--color-brand-primary) */

/* NEVER toggle dark mode by overriding individual properties */
.dark .card { background: #1a1a1a; }     /* Switch via semantic token layer */

/* NEVER mix color spaces */
--color-brand: oklch(0.55 0.18 250);
--color-accent: hsl(200, 80%, 50%);      /* Pick one color space, use it everywhere */

/* NEVER skip the component token tier for reusable components */
.btn { padding: var(--spacing-4); }      /* Use var(--btn-padding-x) for overridability */

/* NEVER use Tailwind arbitrary values for token colors */
<div className="bg-[var(--color-primary)]"> /* Use bg-brand from @theme */

/* NEVER create tokens without documentation */
--color-accent-2: oklch(0.6 0.2 150);   /* What is accent-2? Name semantically */
```

## Example
Task: "Set up design system token architecture"
Action: Build real token infrastructure with:
- Global primitives in OKLCH (colors, spacing, typography, elevation)
- Semantic aliases for light and dark themes
- Component tokens for Button, Card, Input primitives
- Style Dictionary config generating CSS, Tailwind, and iOS outputs
- CSS Cascade Layers for specificity management
- Tailwind @theme consuming semantic tokens
- Storybook theme switcher story

`npm run build:tokens` → Open Storybook → Toggle dark mode → Verify all tokens resolve → Run contrast audit

## Context Protocol
- Before: Read `.claude/context/session/state.json and .claude/context/knowledge/decisions/active.json`
- During: Update `agent_decisions.design-system-architect` with decisions
- After: Add to `tasks_completed`, save context
- After implementation, invoke `code-quality-reviewer` subagent for validation
- On error: Add to `tasks_pending` with blockers

## Integration
- **Provides to:** frontend-ui-developer (token specs, component API contracts, theming infrastructure)
- **Receives from:** accessibility audits (contrast ratios, focus indicators), Figma design team (Variables export)
- **Hands off to:** code-quality-reviewer (validation), frontend-ui-developer (component implementation)
- **Skill references:** design-system-tokens, ui-components, accessibility, responsive-patterns, animation-motion-design, figma-design-handoff


## Status Protocol

Your final output MUST include a `status` field: **DONE**, **DONE_WITH_CONCERNS**, **BLOCKED**, or **NEEDS_CONTEXT**. Never report DONE if you have concerns. Never silently produce work you are unsure about.









---
name: architecture-patterns
license: MIT
description: Architecture validation and patterns for clean architecture, backend structure enforcement, project structure validation, test standards, and context-aware sizing. Use when designing system boundaries, enforcing layered architecture, validating project structure, defining test standards, or choosing the right architecture tier for project scope.
tags: [architecture, clean-architecture, validation, structure, enforcement, testing-standards, right-sizing, over-engineering, context-aware]
skills: [scope-appropriate-architecture]
agent: backend-system-architect
complexity: high
persuasion-type: reference
effort: high
---

<!-- directive-density: intentional (teaches anti-patterns; NEVER markers describe real layering violations, not aspirational guidance) -->

# Architecture Patterns

Consolidated architecture validation and enforcement patterns covering clean architecture, backend layer separation, project structure conventions, and test standards. Each category has individual rule files in `references/` loaded on-demand.

## Quick Reference

| Category | Rules | Impact | When to Use |
|----------|-------|--------|-------------|
| [Clean Architecture](#clean-architecture) | 3 | HIGH | SOLID principles, hexagonal architecture, ports & adapters, DDD |
| [Project Structure](#project-structure) | 2 | HIGH | Folder conventions, nesting depth, import direction, barrel files |
| [Backend Layers](#backend-layers) | 3 | HIGH | Router/service/repository separation, DI, file naming |
| [Test Standards](#test-standards) | 3 | MEDIUM | AAA pattern, naming conventions, coverage thresholds |
| [Right-Sizing](#right-sizing) | 2 | HIGH | Architecture tier selection, over-engineering prevention, context-aware enforcement |

**Total: 13 rules across 5 categories**

## Quick Start

```python
# Clean Architecture: Dependency Inversion via Protocol
class IUserRepository(Protocol):
    async def get_by_id(self, id: str) -> User | None: ...

class UserService:
    def __init__(self, repo: IUserRepository):
        self._repo = repo  # Depends on abstraction, not concretion

# FastAPI DI chain: DB -> Repository -> Service
def get_user_service(db: AsyncSession = Depends(get_db)) -> UserService:
    return UserService(PostgresUserRepository(db))
```

```
# Project Structure: Unidirectional Import Architecture
shared/lib  ->  components  ->  features  ->  app
(lowest)                                    (highest)

# Backend Layers: Strict Separation
Routers (HTTP) -> Services (Business Logic) -> Repositories (Data Access)
```

## Clean Architecture

SOLID principles, hexagonal architecture, ports and adapters, and DDD tactical patterns for maintainable backends.

| Rule | File | Key Pattern |
|------|------|-------------|
| Hexagonal Architecture | `clean-hexagonal-ports-adapters.md` | Driving/driven ports, adapter implementations, layer structure |
| SOLID & Dependency Rule | `clean-solid-dependency-rule.md` | Protocol-based interfaces, dependency inversion, FastAPI DI |
| DDD Tactical Patterns | `clean-ddd-tactical-patterns.md` | Entities, value objects, aggregate roots, domain events |

### Key Decisions

| Decision | Recommendation |
|----------|----------------|
| Protocol vs ABC | Protocol (structural typing) |
| Dataclass vs Pydantic | Dataclass for domain, Pydantic for API |
| Repository granularity | One per aggregate root |
| Transaction boundary | Service layer, not repository |
| Event publishing | Collect in aggregate, publish after commit |

## Project Structure

Feature-based organization, max nesting depth, unidirectional imports, and barrel file prevention.

| Rule | File | Key Pattern |
|------|------|-------------|
| Folder Structure & Nesting | `structure-folder-conventions.md` | React/Next.js and FastAPI layouts, 4-level max nesting, barrel file rules |
| Import Direction & Location | `structure-import-direction.md` | Unidirectional imports, cross-feature prevention, component/hook placement |

### Blocking Rules

| Rule | Check |
|------|-------|
| Max Nesting | Max 4 levels from src/ or app/ |
| No Barrel Files | No index.ts re-exports (tree-shaking issues) |
| Component Location | React components in components/ or features/ only |
| Hook Location | Custom hooks in hooks/ or features/*/hooks/ only |
| Import Direction | Unidirectional: shared -> components -> features -> app |

## Backend Layers

FastAPI Clean Architecture with router/service/repository layer separation and blocking validation.

| Rule | File | Key Pattern |
|------|------|-------------|
| Layer Separation | `backend-layer-separation` | Router/service/repository boundaries, forbidden patterns, async rules |
| Dependency Injection | `backend-dependency-injection` | Depends() chains, auth patterns, testing with DI overrides |
| File Naming & Exceptions | `backend-naming-exceptions` | Naming conventions, domain exceptions, violation detection |

### Layer Boundaries

| Layer | Responsibility | Forbidden |
|-------|---------------|-----------|
| Routers | HTTP concerns, request parsing, auth checks | Database operations, business logic |
| Services | Business logic, validation, orchestration | HTTPException, Request objects |
| Repositories | Data access, queries, persistence | HTTP concerns, business logic |

## Test Standards

Testing best practices with AAA pattern, naming conventions, isolation, and coverage thresholds.

| Rule | File | Key Pattern |
|------|------|-------------|
| AAA Pattern & Isolation | `testing-aaa-isolation` | Arrange-Act-Assert, test isolation, parameterized tests |
| Naming Conventions | `testing-naming-conventions` | Descriptive behavior-focused names for Python and TypeScript |
| Coverage & Location | `testing-coverage-location` | Coverage thresholds, fixture scopes, test file placement rules |

### Coverage Requirements

| Area | Minimum | Target |
|------|---------|--------|
| Overall | 80% | 90% |
| Business Logic | 90% | 100% |
| Critical Paths | 95% | 100% |
| New Code | 100% | 100% |

## Right-Sizing

Context-aware backend architecture enforcement. Rules adjust strictness based on project tier detected by `scope-appropriate-architecture`.

**Enforcement procedure:**
1. Read project tier from `scope-appropriate-architecture` context (set during brainstorm/implement Step 0)
2. If no tier set, auto-detect using signals in `Read /rules/right-sizing-tiers")`
3. Apply tier-based enforcement matrix — skip rules marked OFF for detected tier
4. **Security rules are tier-independent** — always enforce SQL parameterization, input validation, auth checks

| Rule | File | Key Pattern |
|------|------|-------------|
| Architecture Sizing Tiers | `/rules/right-sizing-tiers` | Interview/MVP/production/enterprise sizing matrix, LOC estimates, detection signals |
| Right-Sizing Decision Guide | `/rules/right-sizing-decision` | ORM, auth, error handling, testing recommendations per tier, over-engineering tax |

### Tier-Based Rule Enforcement

| Rule | Interview | MVP | Production | Enterprise |
|------|-----------|-----|------------|------------|
| Layer separation | OFF | WARN | BLOCK | BLOCK |
| Repository pattern | OFF | OFF | WARN | BLOCK |
| Domain exceptions | OFF | OFF | BLOCK | BLOCK |
| Dependency injection | OFF | WARN | BLOCK | BLOCK |
| OpenAPI documentation | OFF | OFF | WARN | BLOCK |

**Manual override:** User can set tier explicitly to bypass auto-detection (e.g., "I want enterprise patterns for this take-home to demonstrate skill").

### Decision Flowchart

```
Is this a take-home or hackathon?
  YES --> Flat architecture. Single file or 3-5 files. Done.
  NO  -->

Is this a prototype or MVP with < 3 months runway?
  YES --> Simple layered. Routes + services + models. No abstractions.
  NO  -->

Do you have > 5 engineers or complex domain rules?
  YES --> Clean architecture with ports/adapters.
  NO  --> Layered architecture. Add abstractions only when pain appears.
```

## When NOT to Use

Not every project needs architecture patterns. Match complexity to project tier:

| Pattern | Interview | Hackathon | MVP | Growth | Enterprise | Simpler Alternative |
|---------|-----------|-----------|-----|--------|------------|---------------------|
| Repository pattern | OVERKILL (~200 LOC) | OVERKILL | BORDERLINE | APPROPRIATE | REQUIRED | Direct ORM calls in service (~20 LOC) |
| DI containers | OVERKILL (~150 LOC) | OVERKILL | LIGHT ONLY | APPROPRIATE | REQUIRED | Constructor params or module-level singletons (~10 LOC) |
| Event-driven arch | OVERKILL (~300 LOC) | OVERKILL | OVERKILL | SELECTIVE | APPROPRIATE | Direct function calls between services (~30 LOC) |
| Hexagonal architecture | OVERKILL (~400 LOC) | OVERKILL | OVERKILL | BORDERLINE | APPROPRIATE | Flat modules with imports (~50 LOC) |
| Strict layer separation | OVERKILL (~250 LOC) | OVERKILL | WARN | BLOCK | BLOCK | Routes + models in same file (~40 LOC) |
| Domain exceptions | OVERKILL (~100 LOC) | OVERKILL | OVERKILL | BLOCK | BLOCK | Built-in ValueError/HTTPException (~5 LOC) |

**Rule of thumb:** If a pattern shows OVERKILL for the detected tier, do NOT use it. Use the simpler alternative. A take-home with hexagonal architecture signals over-engineering, not skill.

## Anti-Patterns (FORBIDDEN)

```python
# CLEAN ARCHITECTURE
# NEVER import infrastructure in domain layer
from app.infrastructure.database import engine  # In domain layer!

# NEVER leak ORM models to API layer
@router.get("/users/{id}")
async def get_user(id: str, db: Session) -> UserModel:  # Returns ORM model!

# NEVER have domain depend on framework
from fastapi import HTTPException
class UserService:
    def get(self, id: str):
        raise HTTPException(404)  # Framework in domain!

# PROJECT STRUCTURE
# NEVER create files deeper than 4 levels from src/
# NEVER create barrel files (index.ts re-exports)
# NEVER import from higher layers (features importing from app)
# NEVER import across features (use shared/ for common code)

# BACKEND LAYERS
# NEVER use database operations in routers
# NEVER raise HTTPException in services
# NEVER instantiate services without Depends()

# TEST STANDARDS
# NEVER mix test files with source code
# NEVER use non-descriptive test names (test1, test, works)
# NEVER share mutable state between tests without reset
```

## Related Skills

- `ork:scope-appropriate-architecture` - Project tier detection that drives right-sizing enforcement
- `ork:quality-gates` - YAGNI gate uses tier context to validate complexity
- `ork:distributed-systems` - Distributed locking, resilience, idempotency patterns
- `ork:api-design` - REST API design, versioning, error handling
- `ork:testing-unit` - Unit testing: AAA pattern, fixtures, mocking, factories
- `ork:testing-e2e` - E2E testing: Playwright, page objects, visual regression
- `ork:testing-integration` - Integration testing: API endpoints, database, contracts
- `ork:python-backend` - FastAPI, SQLAlchemy, asyncio patterns
- `ork:database-patterns` - Schema design, query optimization, migrations



---
title: "Clean Architecture: DDD Tactical Patterns"
category: clean-architecture
impact: HIGH
---

# DDD Tactical Patterns

Domain-Driven Design tactical patterns for building rich domain models in Python.

## Entity (Identity-based)

Entities have a unique identity that persists across state changes.

```python
from dataclasses import dataclass, field
from uuid import UUID, uuid4
from datetime import datetime, timezone

@dataclass
class Analysis:
    id: UUID = field(default_factory=uuid4)
    source_url: str = ""
    status: AnalysisStatus = AnalysisStatus.PENDING
    summary: str | None = None
    created_at: datetime = field(default_factory=lambda: datetime.now(timezone.utc))

    def __eq__(self, other: object) -> bool:
        if not isinstance(other, Analysis):
            return False
        return self.id == other.id  # Identity equality, not structural

    def __hash__(self) -> int:
        return hash(self.id)
```

## Value Object (Structural equality)

Value objects are immutable and compared by their attributes, not identity.

```python
from dataclasses import dataclass

@dataclass(frozen=True)  # Immutable
class AnalysisType:
    category: str
    depth: int

    def __post_init__(self):
        if self.depth < 1 or self.depth > 3:
            raise ValueError("Depth must be 1-3")
        if not self.category:
            raise ValueError("Category cannot be empty")

@dataclass(frozen=True)
class Money:
    amount: Decimal
    currency: str

    def __post_init__(self):
        if self.amount < 0:
            raise ValueError("Amount cannot be negative")

    def add(self, other: "Money") -> "Money":
        if self.currency != other.currency:
            raise ValueError(f"Cannot add {self.currency} and {other.currency}")
        return Money(self.amount + other.amount, self.currency)
```

## Aggregate Root

Aggregates enforce invariants and consistency boundaries. Access child entities only through the root.

```python
class AnalysisAggregate:
    def __init__(self, analysis: Analysis, artifacts: list[Artifact]):
        self._analysis = analysis
        self._artifacts = artifacts
        self._events: list[DomainEvent] = []

    @property
    def id(self) -> UUID:
        return self._analysis.id

    @property
    def status(self) -> AnalysisStatus:
        return self._analysis.status

    def complete(self, summary: str) -> None:
        """Complete the analysis - enforces business rules."""
        if self._analysis.status != AnalysisStatus.IN_PROGRESS:
            raise InvalidStateError("Can only complete in-progress analyses")
        if not self._artifacts:
            raise BusinessRuleViolation("Cannot complete without artifacts")

        self._analysis.status = AnalysisStatus.COMPLETED
        self._analysis.summary = summary
        self._events.append(AnalysisCompleted(self._analysis.id))

    def add_artifact(self, artifact: Artifact) -> None:
        """Add artifact - validates through aggregate root."""
        if len(self._artifacts) >= 100:
            raise BusinessRuleViolation("Maximum 100 artifacts per analysis")
        self._artifacts.append(artifact)
        self._events.append(ArtifactAdded(self._analysis.id, artifact.id))

    def collect_events(self) -> list[DomainEvent]:
        """Collect and clear domain events for publishing."""
        events = self._events.copy()
        self._events.clear()
        return events
```

## Domain Events

Events represent something significant that happened in the domain.

```python
from dataclasses import dataclass, field
from datetime import datetime, timezone
from uuid import UUID, uuid4

@dataclass(frozen=True)
class DomainEvent:
    event_id: UUID = field(default_factory=uuid4)
    occurred_at: datetime = field(default_factory=lambda: datetime.now(timezone.utc))

@dataclass(frozen=True)
class AnalysisCreated(DomainEvent):
    analysis_id: UUID = field(default_factory=uuid4)
    source_url: str = ""

@dataclass(frozen=True)
class AnalysisCompleted(DomainEvent):
    analysis_id: UUID = field(default_factory=uuid4)
    summary: str = ""
```

## Domain Exceptions

Domain-specific exceptions that are independent of any framework.

```python
class DomainException(Exception):
    """Base exception for domain errors."""
    pass

class EntityNotFoundError(DomainException):
    def __init__(self, entity_type: str, entity_id: str):
        self.entity_type = entity_type
        self.entity_id = entity_id
        super().__init__(f"{entity_type} with id {entity_id} not found")

class InvalidStateError(DomainException):
    """Raised when an operation violates state machine rules."""
    pass

class BusinessRuleViolation(DomainException):
    """Raised when a business invariant is violated."""
    pass
```

## Domain Services

For operations that do not naturally belong to any single entity.

```python
class ScoringService:
    """Domain service - stateless, operates on domain objects."""

    def calculate_score(self, analysis: Analysis, artifacts: list[Artifact]) -> float:
        base_score = len(artifacts) * 10
        depth_multiplier = analysis.analysis_type.depth / 3.0
        return min(base_score * depth_multiplier, 100.0)
```

## Repository Pattern (Output Port)

Repositories define the interface for aggregate persistence. One repository per aggregate root.

```python
class IAnalysisRepository(Protocol):
    """Output port - defined in domain, implemented in infrastructure."""
    async def save(self, aggregate: AnalysisAggregate) -> AnalysisAggregate: ...
    async def get_by_id(self, id: UUID) -> AnalysisAggregate | None: ...
    async def find_by_status(self, status: AnalysisStatus) -> list[AnalysisAggregate]: ...
```

## Event Publishing Pattern

Collect events in aggregates, publish after successful persistence.

```python
class AnalysisService:
    def __init__(self, repo: IAnalysisRepository, publisher: IEventPublisher):
        self._repo = repo
        self._publisher = publisher

    async def complete_analysis(self, id: UUID, summary: str) -> None:
        aggregate = await self._repo.get_by_id(id)
        if not aggregate:
            raise EntityNotFoundError("Analysis", str(id))

        aggregate.complete(summary)  # Business logic + domain events
        await self._repo.save(aggregate)  # Persist

        # Publish events AFTER successful commit
        for event in aggregate.collect_events():
            await self._publisher.publish(event)
```


