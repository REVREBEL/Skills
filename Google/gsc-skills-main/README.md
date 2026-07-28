# Google Search Console Skills for Claude Code

Analyze GSC exports to find SEO opportunities, content gaps, and paid search targets.

## What's Included

**gsc-analyzer** - Analyzes GSC exports to identify SEO opportunities, content gaps, and paid search targets. Classifies brand vs. non-brand traffic and estimates revenue impact.

## Installation

```bash
npx skills add coreyrab/gsc-skills
```

Or clone manually:

```bash
git clone https://github.com/coreyrab/gsc-skills.git
cp -r gsc-skills/skills/* ~/.agents/skills/
```

## Usage

Export your data from Google Search Console (Performance → Export), then:

```
"Analyze this GSC export"
"What keywords should we focus on?"
"How much traffic are we missing out on?"
```

The skill will ask you to confirm brand terms before running analysis.

## Analysis Modes

| Mode | What it does |
|------|--------------|
| Brand vs. Non-Brand | Traffic composition, brand dependency score, trend analysis |
| SEO Analyst | Quick wins (position 4-10), striking distance keywords, CTR issues |
| Content Strategist | Topic gaps, question-based content, comparison opportunities |
| Paid Search | High-intent keywords, SERP domination targets, budget allocation |
| Strategic Summary | Key metrics, risks, opportunities with revenue estimates |

## Supported Formats

- GSC zip exports
- Individual CSV files (Queries.csv, Pages.csv, etc.)
- Folders containing GSC exports

## File Structure

```
skills/
└── gsc-analyzer/
    ├── SKILL.md
    ├── scripts/
    │   └── parse_gsc_data.py
    └── references/
        ├── brand_analysis.md
        ├── seo_analysis.md
        ├── content_opportunities.md
        ├── paid_search.md
        └── strategic_frameworks.md
```

## License

MIT
