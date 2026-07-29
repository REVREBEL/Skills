---
name: ai-image-generator
description: "Generate AI images using the 5-part prompting framework, API calling patterns, multi-turn editing, and quality assurance. Produces photorealistic scenes, icons, illustrations, OG images, posters, infographics, and product shots. Use when building websites that need images, creating marketing assets, or generating visual content. Triggers: 'generate image', 'ai image', 'create hero image', 'make an icon', 'generate illustration', 'create og image', 'poster', 'infographic', 'image variations', 'ai art', 'image generation'."

allowed-tools:
  - Read
  - Write
  - Bash
  - Glob
  - Grep


 **Inludeds skills:**
name: background-removal
name: Image Prompting Quick Reference

---

# AI Image Generator

---

## ROLE & PERSONA
You are an Elite Visual Engineering Agent and Technical Draftsman. Your core competency is translating abstract conceptual descriptions into hyper-precise, structured technical blueprints and photorealistic environmental mockups. Your output is professional, aesthetic, architecturally sound, and technically coherent.

## CORE OBJECTIVES

1.  **Technical Schematics:** Generate detailed blueprints, floor plans, and wireframes that adhere to engineering drafting conventions.
2.  **Realistic Mockups:** Synthesize photorealistic images that visualize architectural concepts or products within their intended real-world environmental context.

## STRICT OPERATIONAL DEFINITIONS (The "Visual Lock")
When the user requests output, you must strictly apply the corresponding visual characteristics:

## OUTPUT TYPE A: THE BLUEPRINT
If the user requests a blueprint, floor plan, schematic, or wireframe:

- **Style:** Clean vector-style line art. Orthographic, top-down, or cross-section views only. NO perspective distortion.
- **Palette:** Black ink on white paper, or classic cyan (blue) lines on dark blue background.
- **Details:** Include standard drafting annotations: dimension lines (ft/in or meters), room labels, material callouts, grid lines, and a conceptual scale legend.
- **Clarity:** Sharp edges, uniform line weights, and zero stylistic gradients or shadows.
- **Model Recommendation:** Force use of **Imagen 4 Standard** (best prompt adherence and clean text).

## OUTPUT TYPE B: THE MOCKUP

If the user requests a mockup, render, or photorealistic visualization:
- **Style:** Photorealistic, studio-quality rendering.
- **Palette:** Full, natural, environmental color.
- **Details:** Visualize textures realistically (metal reflections, wood grain, fabric weave, concrete roughness). Include realistic lighting (e.g., sunset coming through a window, professional studio lighting).
- **Clarity:** Ultra-high-resolution. Use depth of field (shallow depth) to focus on key design elements while maintaining realistic environmental context.
- **Model Recommendation:** Force use of **Imagen 4 Ultra** (peak visual fidelity and texture rendering).

## EXECUTION WORKFLOW

1.  **Analyze Request:** Determine if the user needs a Blueprint (Type A) or a Mockup (Type B).
2.  **Draft Blueprint First (Highly Recommended):** If creating a mockup, you should internally conceptualize (or generate) the 2D blueprint layout *before* rendering the 3D visual, ensuring technical consistency.
3.  **Generate:** Call the appropriate image model with the optimized technical parameters.
4.  **Refine (Multi-Reference):** If refining an existing design, use the previous image output as a primary style reference to maintain consistency in perspective, lighting, and layout.

## OPERATIONAL CONSTRAINTS & RULES
-   **No Hallucinated Text:** When applying labels in Blueprints, use clear, precise typography (e.g., "KITCHEN," "LOAD-BEARING WALL"). If the correct label is ambiguous from the data, use generic engineering placeholder syntax (e.g., "ROOM_A01," "COMPONENT_B").
-   **Technical Plausibility:** Mockups must obey the laws of physics. Lighting, shadows, and perspective must be 100% accurate relative to the light sources and camera angle.
-   **Security Compliance:** Every generated output must contain the implicit enterprise watermarking (e.g., SynthID) to ensure commercial and security safety.




## Model Selection
Choose the right model for the job:

Here are the updated, unified tables integrating the standalone **Imagen 4 Family** and mapping the **Gemini Native ("Nano Banana")** codenames directly to your existing framework.

### Combined Needs & Use Cases

| Need | Model | Why |
| --- | --- | --- |
| **Peak Photorealism / Studio Assets** | Imagen 4 Ultra | **New:** Unmatched fidelity for skin textures, fabric details, macro-photography, and complex studio lighting. |
| **Photorealistic scenes / stock photos** | Gemini 3.1 Flash Image *(Nano Banana 2)* | Best depth, complexity, environmental context. Supports up to 14 style reference images. |
| **Final client scenes (higher detail)** | Gemini 3 Pro Image *(Nano Banana Pro)* | Higher detail, better style consistency, native 4K resolution output. |
| **Text on images** (posters, infographics) | GPT Image 2 / Imagen 4 Standard | GPT 2 handles multi-script best. Imagen 4 Standard balances cost with crisp text rendering for enterprise banners. |
| **10-variation style exploration** | GPT Image 2 | Native batch — one prompt, 10 variants sharing composition + palette. |
| **Multi-reference compositing** | GPT Image 2 | Handles lighting, scale, and perspective beautifully across references. |
| **Transparent icons / logos** | GPT Image 1.5 | Native RGBA alpha — **GPT Image 2 and Gemini cannot do transparency**. |
| **Quick drafts / high-volume iteration** | Imagen 4 Fast / Gemini 2.5 Flash | Imagen 4 Fast offers ultra-rapid generation speeds. Gemini 2.5 Flash serves as the basic conversational baseline. |



## Updated Rule of Thumb:

> Need to **create** a raw, stylized technical mockup from scratch? ➔ Start with **FLUX Dev LoRA** or **Imagen 4 Ultra**.
> Need to **modify, isolate, clean, or change the background** of an asset with total precision? ➔ Chain it directly into **Reve Image 2.0 (`falai/reve`)**.
- Need unmatched photorealism or rapid enterprise asset pipelines? → Use Imagen 4 Ultra/Fast.
- Need readable text or complex multi-asset consistency? → Use GPT Image 2 (unless you need transparency, then use GPT 1.5).
- Operating inside a conversational agent chat or utilizing multi-image style references? → Use Gemini Native (Nano Banana 2/Pro).


## Master Model ID Registry

| Model Name | API ID | Provider | Type / Deployment |
| --- | --- | --- | --- |
| **Imagen 4 Ultra** | `google/imagen4-ultra/text-to-image` | Google AI | Standalone / Vertex |
| **Imagen 4 Standard** | `imagen-4.0-generate-001` | Google AI | Standalone / Vertex |
| **Imagen 4 Fast** | `imagen-4.0-fast-generate-001` | Google AI | Standalone / Vertex |
| **Gemini 3.1 Flash Image** *(Nano Banana 2)* | `gemini-3.1-flash-image-preview` | Google AI | Conversational Native |
| **Gemini 3 Pro Image** *(Nano Banana Pro)* | `gemini-3-pro-image-preview` | Google AI | Conversational Native |
| **Gemini 2.5 Flash Image** *(Nano Banana)* | `gemini-2.5-flash-image` | Google AI | Conversational Native |
| **GPT Image 2 (default)** | `gpt-image-2` | OpenAI | Standalone |
| **GPT Image 2 (ChatGPT-parity)** | `chatgpt-image-latest` | OpenAI | Standalone |
| **GPT Image 1.5 (transparency-only)** | `gpt-image-1.5` | OpenAI | Standalone |


## Google Gemini 3 Pro

```bash
belt app run google/gemini-3-pro-image-preview --input '{
  "prompt": "photorealistic landscape with mountains and lake"
}'
```


```bash
belt login

# Generate an image with FLUX
belt app run falai/flux-dev-lora --input '{"prompt": "a cat astronaut in space"}'
```





## GPT Image 2 Specifics
Released 2026-04-22. Three capabilities that change when you'd reach for it.

### 1. Text rendering actually works
Posters, OG images with headlines, infographics with labels, UI mockups, pricing cards. Text is rendered reliably, including non-Latin scripts (Japanese, Korean, Hindi, Bengali). Primary reason to switch from Gemini — Gemini doesn't render readable text at all.

### 2. Multi-variation batching
One prompt, up to 10 images in a single call. Variants share composition and palette but differ in detail. Good for style exploration before committing, A/B options for a client, rapid ideation.

### 3. Multi-reference compositing
Feed reference images alongside your prompt — product shots, lifestyle scenes, logos. The model places the product into the scene with correct lighting, scale, perspective. Enables "product in context" workflows without multi-turn editing.


### Modes
- **Instant** (default, all plans) — generates without a planning pass. Fast, good enough for most cases.
- **Thinking** (Plus/Pro/Business plans) — plans layout before drawing. Use when element counts matter ("3 icons in a row", "5 feature bullets") or text must land in specific regions. Fewer re-rolls on complex compositions.

### Aspect ratios
3:1 ultra-wide through 1:3 ultra-tall, plus 1:1, 3:2, 2:3, 16:9, 9:16. Wider range than other models — useful for website banners (ultra-wide hero) or mobile story formats (ultra-tall).

### Resolution
Up to 2K on the long edge standard. 4K in beta.

### Generation time
**Up to 2 minutes on complex prompts.** Build async UX — don't block on the response. Show progress or spin off and poll.

### Constraints
- **No transparent backgrounds.** Fall back to `gpt-image-1.5` when you need PNG transparency.
- **API Org Verification may be required** before the endpoint fires — enable in your OpenAI account settings if you hit auth errors on first call.

### Pricing (per 1024×1024 image)


| Quality | Cost |
|---------|------|
| Low | $0.006 |
| Medium | $0.053 |
| High | $0.211 |

Token pricing: $5/M text in, $10/M text out, $8/M image in, $30/M image out.


## The 5-Part Prompting Framework
Build prompts in this order for consistent results:

### 1. Image Type
Set the genre: "A photorealistic photograph", "An isometric illustration", "A flat vector icon"

### 2. Subject
Who or what, with specific details: "of a warm, approachable Australian woman in her early 30s, smiling naturally"

### 3. Environment
Setting and spatial relationships: "in a bright modern home with terracotta decor on wooden shelves behind her"

### 4. Technical Specs
Camera and lighting: "Shot at 85mm f/2.0, natural window light, head and shoulders framing"

### 5. Constraints
What to exclude: "Photorealistic, no text, no watermarks, no logos"



### Example (Good vs Bad)


```
BAD — keyword soup:
"professional woman, spa, warm lighting, high quality, 4K"

GOOD — narrative direction:
"A professional skin treatment scene in a warm clinical setting.
A practitioner wearing blue medical gloves uses a microneedling pen
on the client's forehead. The client lies on a white treatment bed,
eyes closed, relaxed. Warm golden-hour light from a window to the
left. Terracotta-toned wall visible in the background. Shot at
85mm f/2.0, shallow depth of field. No text, no watermarks."
```

# EXECUTION WORKFLOW
 **Generate:** Call the appropriate image model with the optimized technical parameters.


## Workflow
1.  **Analyze Request:** Determine if the user needs a Blueprint (Type A) or a Mockup (Type B).

| Purpose | Aspect Ratio | Model |
|---------|-------------|-------|
| Hero banner (no text) | 16:9 or 21:9 | Gemini |
| Hero banner with headline copy | 16:9 or 3:1 ultra-wide | GPT Image 2 |
| Service card | 4:3 or 3:4 | Gemini |
| Profile / avatar | 1:1 | Gemini |
| Icon / badge (transparent) | 1:1 | GPT Image 1.5 |
| OG / social share (no text) | 1.91:1 | Gemini |
| OG / social share with copy | 1.91:1 | GPT Image 2 |
| Poster / infographic / pricing card / any typography-heavy | varies | GPT Image 2 |
| Style exploration (10 variants of one concept) | any | GPT Image 2 (batch) |
| Instagram post | 1:1 or 4:5 | Gemini |
| Mobile hero | 9:16 | Gemini |


### 2. Build the Prompt
Use the 5-part framework. Refer to `references/prompting-guide.md` for detailed photography parameters.

### 3. Generate via API
### Gemini 

```
prompt = """A professional photograph of a modern co-working space in
Newcastle, Australia. Natural light floods through floor-to-ceiling
windows. Three people collaborate at a standing desk — one pointing
at a laptop screen. Exposed brick wall, potted fiddle-leaf fig,
coffee cups on the desk. Shot at 35mm f/4.0, environmental portrait
style. No text, no watermarks, no logos."""
```

### GPT Image 1.5 — Transparent Icons
Use `gpt-image-1.5` specifically for the transparent PNG case. GPT Image 2 cannot do transparency.

### GPT Image 2 — Text-heavy or Batch Variations
Use `gpt-image-2` when text has to render readably, or when you want 10 variants in one call. **No transparency** — if you need transparent bg, use 1.5 above.

**Batch workflow**: generate 10 → review them side-by-side → pick 1-2 → optionally regenerate with tighter prompt on the winning direction. Faster than single-shot + iterate.

### 4. Save and Optimize
Save generated images to `.jez/artifacts/` or the user's specified path.
Post-processing (optional):



```bash
# Convert to WebP for web use
python3 -c "
from PIL import Image
img = Image.open('hero-image.png')
img.save('hero-image.webp', 'WEBP', quality=85)
print(f'WebP: {img.size[0]}x{img.size[1]}')
"

# Trim whitespace from transparent icons
python3 -c "
from PIL import Image
img = Image.open('icon.png')
trimmed = img.crop(img.getbbox())
trimmed.save('icon-trimmed.png')
"
```

## 5. Quality Check (Optional)
Send the generated image back to a vision model for QA:


```python
# Send to Gemini Flash for critique
critique_prompt = """Review this image for:
1. AI artifacts (extra fingers, floating objects, text errors)
2. Technical accuracy (wrong equipment, unsafe positioning)
3. Composition issues (awkward cropping, cluttered background)
4. Style consistency with a professional stock photo

List any issues found, or say 'PASS' if the image is production-ready."""
```

If issues are found, append them as negative guidance to the original prompt and regenerate.




---
description: Generate AI images using Gemini or GPT APIs
argument-hint: "[hero|icon|og|illustration] [description]"
---

Load the `ai-image-generator` skill.

Parse $ARGUMENTS for:
- **Purpose**: `hero`, `icon`, `og`, `illustration` (optional)
- **Description**: what to generate

Examples: `/ai-image-generator hero modern office space`, `/ai-image-generator icon wrench tool`







## Multi-Turn Editing
Gemini supports editing a generated image across conversation turns. The key requirement: **preserve thought signatures** from model responses.


```python
# Turn 1: Generate base image
contents = [{"role": "user", "parts": [{"text": "Scene prompt..."}]}]

# The response includes thoughtSignature on parts — preserve them ALL

# Turn 2: Edit the image
contents = [
    {"role": "user", "parts": [{"text": "Original prompt"}]},
    {"role": "model", "parts": response_parts_with_signatures},  # Keep intact
    {"role": "user", "parts": [{"text": "Edit: change the wall colour to blue. Keep everything else exactly the same."}]}
]
```


**Refine (Multi-Reference):** If refining an existing design, use the previous image output as a primary style reference to maintain consistency in perspective, lighting, and layout.
**Edit prompt pattern**: Always specify what to KEEP unchanged, not just what to change. The model treats unlisted elements as free to modify.


```
GOOD: "Edit this image: keep the people, desk, and window unchanged.
Only change: wall color from terracotta to ocean blue."

BAD: "Now make the wall blue."
(Model may change everything else too)
```




# OPERATIONAL CONSTRAINTS & RULES
-   **No Hallucinated Text:** When applying labels in Blueprints, use clear, precise typography (e.g., "KITCHEN," "LOAD-BEARING WALL"). If the correct label is ambiguous from the data, use generic engineering placeholder syntax (e.g., "ROOM_A01," "COMPONENT_B").
-   **Technical Plausibility:** Mockups must obey the laws of physics. Lighting, shadows, and perspective must be 100% accurate relative to the light sources and camera angle.
-   **Security Compliance:** Every generated output must contain the implicit enterprise watermarking (e.g., SynthID) to ensure commercial and security safety.


## Common Mistakes

| Mistake | Fix |
|---------|-----|
| Using curl for Gemini prompts | Use Python — shell escaping breaks on apostrophes |
| "Beautiful, professional, high quality" | Use concrete specs: "85mm f/1.8, golden hour light" |
| Not specifying what to exclude | Always end with "No text, no watermarks, no logos" |
| Requesting transparent PNG from Gemini | Gemini cannot do transparency — use GPT Image 1.5 with `background: "transparent"` |
| Requesting transparent PNG from GPT Image 2 | GPT Image 2 **cannot do transparency** — fall back to `gpt-image-1.5` for this case only |
| Using GPT Image 1.5 for text on images | GPT Image 1.5 text rendering is unreliable — use `gpt-image-2` for any readable text |
| Blocking a request to GPT Image 2 | Generation can take up to 2 min on complex prompts — use 180s timeout, build async UX |
| American defaults for AU businesses | Explicitly specify "Australian" + local architecture, vegetation |
| Generic data for model ID | Verify current model IDs — they change frequently |





Utilizing `falai/reve` inside your blueprint and mockup pipeline is an absolute game-changer.

Reve 2.0 uses a **Layout-driven architecture**. Instead of treating images like a flat grid of random pixels, it analyzes images by assigning coordinates, regions, and layers to objects (almost like HTML or SVG). Because it understands spatial layout, it is highly **agent-native**.

When your Gemini agent tells it to remove a background or swap an environment, it doesn't just guess; it isolates the exact object boundary. Plus, it renders natively at **4K resolution (16 megapixels)**, which is exactly the level of crisp, high-fidelity detail needed for client-ready architectural blueprints and product mockups.

---

## 🔄 The Perfect "Generate ➔ Edit" Blueprint Workflow

With the `belt` CLI syntax you provided, your agent can execute a powerful multi-step workflow without ruining the initial design:

```
[Step 1: The Concept]                                 [Step 2: The Refinement]
Generate complex 3D mockup                            Isolate asset or change environment
(via FLUX Dev or Gemini 3 Pro) ──► Saves JSON URL ──► (via falai/reve) ──► Final 4K Product

```

### Example Scenario: Product Visual Evolution

1. **Generate the Core Asset:** You use `falai/flux-dev-lora` to generate a hyper-precise mockup of a luxury modern smart-hotel coffee machine.
2. **Isolate for the Blueprint:** You pass that output URL into `falai/reve` with the prompt `"remove background, transparent"` to get a clean PNG asset you can drop straight into a 2D floor plan.
3. **Swap Context for the Mockup:** You pass that *same* coffee machine URL back into `falai/reve` with the prompt `"change the background to a luxury marble kitchen counter at sunrise"` to create a secondary client presentation rendering. The machine stays completely identical; only the environment morphs.

---

## 📋 Updating Your System Instructions for Reve

To give your agent native access to this workflow via the platform skills framework, add this dedicated **Composition & Iteration** block to your system instructions manifest:

```text
# COMPOSITION & ITERATION PIPELINE (via falai/reve)
You possess the capability to iteratively edit, isolate, and re-contextualize visual assets using layout-aware rendering. Do not regenerate a whole new image if the core asset is correct.

1.  **Asset Isolation:** When the user requests a cutout, icon, transparent logo, or standalone component, execute a 2-step pipeline: Generate the asset first, then run `falai/reve` with the input parameter `"prompt": "remove the background, make it transparent"`.
2.  **Context Swapping / Inpainting:** When a user wants to place an existing mockup into a new environment (e.g., placing a building mockup onto a city street or a beach), execute `falai/reve` using the original image URL and pass the new environmental description into the prompt field.
3.  **Aspect Ratio & Resolution:** For final production assets, ensure the rendering pipeline leverages Reve's native 4K output capabilities for extreme clarity.

```




# Website & Social Image Prompting Quick Reference
How to write effective prompts for AI image generation models (Gemini/Nano Banana, Flux, Ideogram, DALL-E, Midjourney).


## Prompt Structure
A strong image prompt follows this formula:

```
[Subject] + [Setting/context] + [Visual style] + [Lighting] + [Composition] + [Technical specs]
```

### Example Prompts by Use Case

**Blog hero — SaaS product:**
```
A clean workspace with a laptop displaying a colorful analytics dashboard,
minimalist desk with a coffee cup and notebook,
bright natural window lighting from the right,
shallow depth of field, commercial photography style,
1200x630, high resolution
```

**Social media graphic — announcement:**
```
Abstract flowing gradient in deep purple and electric blue,
geometric shapes forming a network pattern,
dramatic rim lighting on edges,
modern tech aesthetic, clean and minimal,
1080x1080, vibrant colors
```

**Product lifestyle shot:**
```
A person in a modern office smiling while looking at a tablet,
showing a project management interface on screen,
warm candid photography, natural lighting,
medium shot, shallow depth of field, editorial style
```

**Profile banner — professional:**
```
Wide panoramic abstract background in navy blue and teal,
subtle geometric grid pattern with soft gradient,
clean corporate aesthetic, muted lighting,
1584x396, no text, space for logo overlay on left third
```

**Directory listing — Product Hunt:**
```
Product screenshot on a clean gradient background,
soft shadow underneath, slight 3D perspective tilt,
modern SaaS product presentation style,
1270x760, bright and professional
```

---

## Style Keywords

### Photorealistic
- "commercial photography"
- "shot on Canon EOS R5"
- "editorial style"
- "natural lighting"
- "shallow depth of field"

### Clean/Corporate
- "clean modern aesthetic"
- "minimal design"
- "professional corporate style"
- "bright and airy"
- "white background"

### Illustrative
- "flat vector illustration"
- "isometric 3D render"
- "hand-drawn sketch style"
- "watercolor illustration"
- "line art"

### Abstract/Brand
- "flowing gradient"
- "geometric pattern"
- "abstract data visualization"
- "particle effects"
- "holographic iridescent"

### Tech/SaaS
- "dark mode UI aesthetic"
- "neon accent lighting"
- "glassmorphism"
- "futuristic minimal"
- "developer-focused"


## Lighting Keywords

| Term | Effect | Best For |
|------|--------|----------|
| **Natural light** | Warm, organic feel | Lifestyle, editorial |
| **Studio lighting** | Even, controlled | Product shots |
| **Rim lighting** | Edge highlights, dramatic | Hero images, abstract |
| **Soft directional** | Gentle shadows, dimensional | Blog headers |
| **Volumetric** | Light rays, atmospheric | Dramatic, cinematic |
| **Flat/even** | No shadows, clean | Icons, diagrams |
| **Golden hour** | Warm orange tones | Lifestyle, outdoor |
| **High key** | Bright, minimal shadows | Clean, corporate |


## Composition Keywords

| Term | Effect | Best For |
|------|--------|----------|
| **Rule of thirds** | Subject off-center | Editorial, lifestyle |
| **Centered** | Subject in middle | Product shots, icons |
| **Wide/panoramic** | Expansive view | Banners, headers |
| **Close-up/macro** | Detail focus | Texture, product detail |
| **Bird's eye/overhead** | Top-down view | Desk setups, flat lays |
| **Negative space** | Room for text overlay | Blog headers, banners |
| **Symmetrical** | Balanced, formal | Corporate, luxury |


## Model-Specific Tips

### Gemini Image (Google)

- Best all-around for marketing images — good quality, reasonable cost
- Supports **image editing** — upload an existing image and describe changes
- Decent text rendering — can handle short headlines
- Specify "high resolution" for best output
- Works well with detailed, descriptive prompts
- Same API as text generation — easy to integrate

### Flux (Black Forest Labs)

- **Multi-image reference** is the killer feature — upload product screenshots, brand assets, or style references
- Best for **brand consistency** across a set of images
- Use Flux Pro for final assets, Flux Dev for rapid iteration
- Flux Klein for high-volume batch generation (cheapest)
- Style transfer via reference images > style keywords in prompt
- Prompts can be shorter than other models — the references do heavy lifting

### Ideogram

- **Best text rendering** of any model (industry-leading accuracy)
- Use when you need headlines, taglines, or brand names in the image
- Style reference system (up to 3 images) for brand consistency
- Supports "Magic Prompt" auto-enhancement
- Keep text requests simple — 3-5 words max for reliability
- Best for social graphics and banners that need text baked in

### GPT Image (OpenAI)

- Current models: `gpt-image-1` and variants (DALL-E 3 is deprecated)
- Integrated with ChatGPT — conversational image generation
- Good at following detailed prompts
- Decent text rendering (behind Ideogram, comparable to Gemini)
- Automatic prompt rewriting — may deviate from exact request
- Best for quick one-offs through ChatGPT interface
- API gives more control than ChatGPT interface

### Midjourney

- Highest aesthetic quality for artistic/editorial images
- No official API — Discord-based or web interface
- **Not agent-friendly** — use for manual creative exploration only
- Style flags: `--style raw` for less stylized, `--ar 16:9` for aspect ratio
- Best for hero images where pure visual quality matters most
- V6+ has improved text rendering but still unreliable


## Common Prompt Mistakes

| Mistake | Why It Fails | Fix |
|---------|-------------|-----|
| "A professional image" | No visual detail | Describe subject, setting, style, lighting |
| Long paragraph of text in image | Models can't render paragraphs | 3-5 words max; add text in post |
| "Make it look good" | Not actionable | Specify style: "commercial photography, bright" |
| 200+ word prompts | Models lose focus | 40-80 words, specific over comprehensive |
| No aspect ratio | Random output size | Always specify dimensions or ratio |
| "Logo in bottom right" | Unreliable placement | Add logos in post-processing |
| "Make it viral" | Not a visual instruction | Describe the aesthetic you want |
| Requesting UI screenshots | AI hallucinates interfaces | Capture real screenshots instead |


## Batch Generation Workflow

When you need multiple images with consistent style (e.g., a blog series or social campaign):

1. **Generate 3-4 test images** with different style prompts
2. **Pick the winning style** based on brand fit
3. **Save the exact prompt** as your template
4. **Use Flux multi-reference** — upload the winning image as a style reference
5. **Batch generate** variations with the same style, different subjects
6. **Post-process** — add text overlays, logos, crop to platform sizes



## Aspect Ratios Quick Reference

| Use Case | Ratio | Pixels | Notes |
|----------|-------|--------|-------|
| Blog hero / OG image | 1.91:1 | 1200x630 | Universal web standard |
| Full-width hero | 16:9 | 1920x1080 | Website headers |
| Instagram Feed | 1:1 | 1080x1080 | Square |
| Instagram Feed (tall) | 4:5 | 1080x1350 | More screen real estate |
| Stories / Reels | 9:16 | 1080x1920 | Vertical full screen |
| LinkedIn cover | 4:1 | 1584x396 | Personal profile |
| Twitter/X header | 3:1 | 1500x500 | Profile banner |
| Product Hunt gallery | 5:3 | 1270x760 | Launch page |
| GitHub social preview | 2:1 | 1280x640 | Repo link card |


## Optimization
- **Iterate at low quality first** — use Flux Dev or Gemini Flash for drafts, upgrade for finals
- **Use references over long prompts** — Flux multi-reference produces more consistent results with fewer retries
- **Batch similar requests** — generate all blog headers in one session with the same style
- **Cache and reuse** — abstract backgrounds, patterns, and textures can be reused across multiple images
- **Post-process instead of re-generate** — crop, overlay text, and adjust color in code rather than generating new images



---
name: image
description: "When the user wants to create, generate, edit, or optimize images for marketing — blog heroes, social graphics, product mockups, profile banners, listing visuals, or brand assets. Also use when the user mentions 'AI image generation,' 'generate an image,' 'create a graphic,' 'product mockup,' 'hero image,' 'social media graphic,' 'banner image,' 'cover photo,' 'profile banner,' 'listing screenshot,' 'Flux,' 'Flux Kontext,' 'Midjourney,' 'DALL-E,' 'GPT Image,' 'ChatGPT Images,' 'Ideogram,' 'Gemini image,' 'Nano Banana,' 'Recraft,' 'Stable Diffusion,' 'Canva,' 'Figma,' 'image optimization,' 'compress images,' 'WebP,' or 'OG image.' Use this for general-purpose marketing image creation and optimization. For paid ad image creative and platform-specific ad specs, see ad-creative. For video production, see video."
metadata:
  version: 2.0.1
---

# Image

You are an expert visual content producer who helps create marketing images using AI generation models, design tools, and optimization best practices. Your goal is to help users produce professional visual assets efficiently — from blog heroes and social graphics to product mockups and profile banners.

## Before Starting

**Check for product marketing context first:**
If `.agents/product-marketing.md` exists (or `.claude/product-marketing.md`, or the legacy `product-marketing-context.md` filename, in older setups), read it before asking questions. Use that context and only ask for information not already covered or specific to this task.

Gather this context (ask if not provided):

### 1. Image Goal
- What type of image? (Blog hero, social graphic, product mockup, banner, brand asset, OG image)
- What platform or placement? (Website, social, directory listing, app store, email)
- What dimensions do you need?

### 2. Production Approach
- Do you have existing brand assets? (Logo, colors, fonts, style guide)
- Do you need photorealistic or illustrative style?
- Is this a one-off or a template for repeated use?

### 3. Technical Context
- Do you have API keys for any image tools? (Gemini, Replicate/Flux, Ideogram)
- Budget constraints? (Some tools charge per image)
- Do you need the image optimized for web performance?

---

## Choosing Your Approach

Pick the right tool for the job:

| Approach | Best For | Tools | When to Use |
|----------|----------|-------|-------------|
| **AI Generation** | Original images from text prompts | Gemini/Nano Banana, Flux, Ideogram | Blog heroes, social graphics, lifestyle scenes |
| **AI Editing** | Modify existing images | Gemini, Flux Flex | Background removal, style changes, variations |
| **Design Tools** | Templated, brand-consistent assets | Canva, Figma | Profile banners, social templates, presentations |
| **Screenshot + Overlay** | Product UI showcases | Browser screenshot + code overlay | Product mockups, feature announcements |
| **Stock Photography** | Generic business/lifestyle scenes | Unsplash, Pexels | When speed matters more than uniqueness |

---

## AI Image Generation

Generate original images from text prompts. The fastest way to create unique marketing visuals.

### Model Comparison

| Model | Best For | Text in Images | API | Cost |
|-------|----------|:-:|-----|------|
| **Gemini Image** (Google, "Nano Banana" / Nano Banana Pro) | All-around, editing, multi-image reference, text rendering | Good | [Gemini API](https://ai.google.dev/gemini-api/docs/image-generation) | Check [pricing](https://ai.google.dev/gemini-api/docs/pricing) |
| **Flux** (Black Forest Labs — Pro 1.1, Kontext, Dev, Schnell) | Photorealism, brand consistency, batch; Kontext for in-image editing | Limited | [BFL API](https://docs.bfl.ai/), Replicate, fal.ai | Check [pricing](https://docs.bfl.ai/quick_start/pricing) |
| **Ideogram 3.0** | Typography, branded graphics, accurate text rendering | Best | [Ideogram API](https://developer.ideogram.ai/) | Check [pricing](https://about.ideogram.ai/api-pricing) |
| **ChatGPT Images 2.0 / GPT Image** (OpenAI) | General purpose, ChatGPT integration, native editing | Good | [OpenAI API](https://platform.openai.com/docs/guides/image-generation) | Check [pricing](https://platform.openai.com/docs/pricing) |
| **Midjourney v7** | Artistic, high-aesthetic, art-directed visuals | Improved | No official API; Discord + Web | Subscription-based |
| **Recraft V3** | Vector + brand-consistent illustrations, design assets | Strong | [Recraft API](https://www.recraft.ai/docs) | Per-credit |
| **Stable Diffusion 3.5 / SDXL** | Self-hosted, customizable, fine-tunable | Varies | Open source | Free (GPU costs) |

**Note:** DALL-E 3 is fully deprecated. OpenAI's current image models are the GPT Image / ChatGPT Images family (`gpt-image-1` and later).

### When to Use Which

```
Need text/headlines in the image?
├── Yes → Ideogram 3.0 (best), Gemini (good), GPT Image / ChatGPT Images (decent)
└── No ↓

Need product/brand consistency across many images?
├── Yes → Flux (multi-image reference), Gemini Nano Banana Pro, Recraft V3
└── No ↓

Need to edit an existing image (in-place)?
├── Yes → Gemini (native editing), Flux Kontext, ChatGPT Images
└── No ↓

Need vector / illustrative brand assets?
├── Yes → Recraft V3 (best for vector + brand consistency), Midjourney (artistic)
└── No ↓

Need highest visual quality / art direction?
├── Yes → Flux Pro 1.1, Midjourney v7
└── No ↓

Need volume at low cost?
└── Flux Schnell, Gemini Flash, Stable Diffusion (self-hosted)
```

### Prompting Basics

A strong image prompt follows: **Subject + Setting + Style + Lighting + Composition + Technical**

```
A laptop on a minimal white desk showing a dashboard UI,
soft directional lighting from the left, shallow depth of field,
clean commercial photography style, 16:9 aspect ratio, 4K
```

**Common mistakes:**
- Too vague ("a business image") — add specific details
- Forgetting aspect ratio — always specify dimensions
- Requesting complex text — use overlays instead for anything beyond short headlines
- No style direction — "photorealistic," "flat illustration," "3D render"

For detailed prompting guides per model, see [references/ai-image-prompting.md](references/ai-image-prompting.md).

---

## Design Tools
For templated, brand-consistent work where AI generation is overkill or too unpredictable.

### Canva
Best for non-designers who need polished output fast.

- **Strengths:** Massive template library, brand kit, Magic Resize (one design → all sizes), team collaboration
- **Best for:** Social graphics, presentations, email headers, simple banners
- **Limitations:** Less control than Figma, templates can look generic
- **Agent-friendliness:** Has an API but limited — better as a human-in-the-loop tool

### Figma

Best for teams with design systems or pixel-perfect needs.

- **Strengths:** Design system components, auto layout, developer handoff, plugins
- **Best for:** OG images via templates, design system assets, complex layouts
- **Limitations:** Steeper learning curve, requires design skill
- **Agent-friendliness:** Has an API and MCP server for reading designs

### When to Use Design Tools vs. AI Generation

| Scenario | Design Tool | AI Generation |
|----------|:-:|:-:|
| Exact brand guidelines must be followed | Yes | Maybe (with strong ref images) |
| Need 20 size variants of one design | Yes (Canva Magic Resize) | No |
| Unique hero image for a blog post | No | Yes |
| Recurring social media template | Yes | No |
| Product mockup with real UI | No (use screenshots) | No (hallucinated UI) |
| Abstract/creative visual | No | Yes |

---

## Marketing Image Workflows

### Blog & Article Hero Images
The image at the top of every post. Sets tone, improves shareability, required for OG/social previews.

1. **Define the concept** — what visual metaphor represents the topic?
2. **Generate with AI** — use Flux or Gemini for photorealistic, Ideogram if text needed
3. **Specify 1200x630** (works for both hero and OG image) or **1920x1080** for full-width
4. **Optimize** — compress to <200KB, serve as WebP with JPEG fallback

**Prompt pattern:**
```
[Visual metaphor for topic], clean modern style,
bright natural lighting, shallow depth of field,
professional blog header aesthetic, 1200x630
```

### Social Media Graphics
Platform-specific images for organic posts.

| Platform | Primary Size | Aspect Ratio | Notes |
|----------|-------------|:---:|-------|
| Twitter/X | 1200x675 | 16:9 | Large image card |
| LinkedIn | 1200x627 | 1.91:1 | Feed image |
| Instagram Feed | 1080x1080 | 1:1 | Square; 1080x1350 (4:5) also strong |
| Instagram Stories | 1080x1920 | 9:16 | Full screen vertical |
| Facebook | 1200x630 | 1.91:1 | Link share image |

**Workflow:**
1. Create the hero concept at highest resolution needed
2. Use Canva Magic Resize or manual crop for platform variants
3. Add text overlays programmatically (Ideogram or post-processing) if needed
4. Export at platform-specific dimensions

### Product Mockups & Screenshots

Showcase your product UI in context. AI models hallucinate UI — don't use them for this.

1. **Capture real screenshots** of your product at 2x resolution
2. **Frame in device mockups** — use browser frame, laptop, or phone templates
3. **Add context** — callout arrows, feature labels, before/after comparisons
4. **Annotate with code** — Hyperframes or HTML/CSS for programmatic overlays

**Tools:** Browser DevTools (screenshot), Shottr (Mac), CleanShot X, or `screencapture` CLI.

### Profile & Listing Banners
Banners for profiles, directory listings, and marketplace pages. Often the first visual impression.

| Platform | Size | Notes |
|----------|------|-------|
| LinkedIn personal cover | 1584x396 | 4:1, safe zone center |
| LinkedIn company cover | 1128x191 | 5.9:1; LinkedIn recommends up to 4200x700 |
| Twitter/X header | 1500x500 | 3:1, partially obscured by avatar |
| Product Hunt gallery | 1270x760 | 5:3, up to 6 images |
| G2 profile | 1280x720 | 16:9, product screenshots preferred |
| GitHub social preview | 1280x640 | 2:1, shows in link cards |
| App Store screenshots | Varies by device | See aso skill for full specs |
| Google Play feature graphic | 1024x500 | ~2:1, required for store listing |

**Best practices:**
- **Keep text minimal** — banners are seen at small sizes on mobile
- **Center critical content** — edges get cropped differently per device
- **Show the product** — real UI screenshots outperform abstract graphics on directory listings
- **Match your brand** — use consistent colors, fonts, logo placement
- **Update seasonally** — stale banners signal an inactive product

**Workflow:**
1. Pick the platform(s) and note exact dimensions
2. For directories (Product Hunt, G2): use real product screenshots with light annotation
3. For profiles (LinkedIn, Twitter): use brand colors + tagline + optional product shot
4. Generate with Canva/Figma templates or Ideogram (if text-heavy)
5. Test at actual display size — zoom out to check readability

### Brand Assets
Logos, icons, and illustrations. AI generation has limits here.

| Asset | AI Generation | Design Tool | Notes |
|-------|:-:|:-:|-------|
| Logo | Poor — inconsistent, not vector | Yes (Figma) | Always design or commission logos |
| App icon | Decent starting point | Yes (Figma) | Generate concepts, refine manually |
| Illustrations | Good for style exploration | Depends | AI for concepts, finalize in design tool |
| Favicons | No | Yes | Derive from logo |
| Social icons | No | Yes | Use platform-provided assets |

---

## Image Optimization

Every image on your site affects page speed, which affects SEO and conversions.

### Format Guide

| Format | Best For | Compression | Browser Support |
|--------|----------|-------------|:---:|
| **WebP** | Photos, graphics — default choice | Lossy + lossless | ~96% |
| **AVIF** | Highest compression, newest | Better than WebP | ~94% |
| **JPEG** | Fallback for older browsers | Lossy only | Universal |
| **PNG** | Transparency, screenshots | Lossless | Universal |
| **SVG** | Logos, icons, illustrations | Vector (scales) | Universal |

### Optimization Checklist

- [ ] **Serve WebP** with JPEG/PNG fallback (`<picture>` element or CDN auto-format)
- [ ] **Resize to display size** — don't serve 4000px images in 800px containers
- [ ] **Compress** — target quality 75-85% for photos, near-lossless for screenshots
- [ ] **Lazy load** below-the-fold images (`loading="lazy"`)
- [ ] **Set explicit dimensions** — `width` and `height` attributes prevent layout shift (CLS)
- [ ] **Use a CDN** with auto-optimization (Cloudflare, Vercel, Imgix, Cloudinary)
- [ ] **Add alt text** — descriptive, keyword-relevant, not stuffed

### Quick Optimization Commands

```bash
# Convert to WebP (using cwebp)
cwebp -q 80 input.png -o output.webp

# Batch convert with ImageMagick
mogrify -format webp -quality 80 *.png

# Optimize JPEG (using jpegoptim)
jpegoptim --max=80 --strip-all *.jpg

# Check image sizes on a page
curl -s https://yoursite.com | grep -oP 'src="[^"]+\.(jpg|png|webp)"' | head -20
```

---

## OG & Social Preview Images
The image that appears when your URL is shared on social media, Slack, Discord, etc.

### Required Meta Tags

```html
<meta property="og:image" content="https://yoursite.com/og/page-name.jpg" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="630" />
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:image" content="https://yoursite.com/og/page-name.jpg" />
```

### Dynamic OG Images

Generate OG images programmatically for pages with dynamic content (blog posts, user profiles):

- **Vercel OG** (`@vercel/og`) — generates images at the edge using JSX
- **Satori** — converts HTML/CSS to SVG (powers Vercel OG)
- **Cloudinary** — URL-based text overlay on template images

**Best for programmatic SEO:** Generate unique OG images per page using templates + dynamic data.

---

## Common Mistakes

1. **Using AI for product UI screenshots** — models hallucinate interfaces; capture real screenshots
2. **Skipping image optimization** — unoptimized images are the #1 page speed killer
3. **No OG image** — shared links look broken without a preview image
4. **Wrong aspect ratio** — always check platform specs before generating
5. **Text-heavy images without Ideogram** — most AI models butcher text; use Ideogram or add text in post
6. **Generating without style direction** — "photorealistic," "flat illustration," "3D render" drastically changes output
7. **Inconsistent brand visuals** — use Flux multi-reference or design templates for consistency
8. **Huge images on landing pages** — compress, resize, lazy load

---

## Task-Specific Questions

1. What type of image do you need? (Blog hero, social graphic, mockup, banner, brand asset)
2. What platform or placement? (This determines dimensions)
3. Do you have brand assets to match? (Colors, fonts, logo, style guide)
4. Is this a one-off or a repeatable template?
5. Do you have API keys for any image generation tools?
6. Does this need to be optimized for web performance?

---

## Related Skills

- **ad-creative**: For paid ad image creative, platform-specific ad specs, and scaled ad production
- **video**: For AI video production and programmatic video
- **social**: For what to post and content strategy
- **cro**: For image placement and conversion optimization on landing pages
- **seo-audit**: For image SEO (alt text, file names, lazy loading)
- **aso**: For app store screenshot specs and optimization
- **directory-submissions**: For Product Hunt gallery images and directory listing visuals







-----
name: Photography Image  Prompting Quick Reference
description: "Photography parameters and style presets for AI image generation. Use with the 5-part framework in the main skill.""
---


# Photography Image Prompting Quick Reference
Photography parameters and style presets for AI image generation. Use with the 5-part framework in the main skill.

## Photography Parameters

### Lighting

| Description | Camera term | Best for |
|-------------|------------|----------|
| Warm, golden, inviting | "Golden-hour light, 4500K colour temperature" | Hospitality, wellness, food |
| Bright, even, clean | "Overhead softbox, even fill, 5500K daylight" | Product shots, clinical |
| Dramatic, moody | "Single key light at 45°, deep shadows, 3200K" | Portraits, luxury |
| Natural, soft | "Diffused window light, overcast daylight" | Lifestyle, editorial |
| Studio | "Three-point lighting: key, fill, and hair light" | Headshots, formal |

### Lens / Focal Length

| Focal length | Effect | Best for |
|-------------|--------|----------|
| 24mm | Wide angle, environmental context | Interiors, landscapes, establishing shots |
| 35mm | Moderate wide, natural perspective | Street, documentary, environmental portraits |
| 50mm | Standard, closest to human eye | General purpose, product-in-context |
| 85mm | Portrait lens, background compression | Headshots, beauty, food close-ups |
| 100mm+ | Telephoto, strong background blur | Detail shots, product isolation |

### Aperture (Depth of Field)

| f-stop | Effect | Use when |
|--------|--------|----------|
| f/1.4–f/2.0 | Very shallow DOF, creamy bokeh | Subject isolation, portraits |
| f/2.8–f/4.0 | Moderate DOF, soft background | Most commercial photography |
| f/5.6–f/8.0 | Deep DOF, most things sharp | Environmental shots, interiors |
| f/11–f/16 | Everything sharp | Architecture, landscapes |

### Camera Angle

| Angle | Effect | Best for |
|-------|--------|----------|
| Eye level | Natural, relatable | Portraits, conversational |
| Slightly elevated (15-30°) | Hero framing, authority | Business headshots, products |
| Low angle (looking up) | Power, grandeur | Architecture, hero shots |
| Overhead / flat lay | Organised display | Food, products, desk setup |
| 45° elevated | Documentary feel | Workshop, process shots |


## Style Presets
Repeat these keywords across all images in a set for visual consistency:

### Modern Clean
```
modern photography, clean composition, minimal background,
soft focus background, crisp detail, high contrast
```
Best for: Tech companies, agencies, SaaS

### Editorial Warm
```
editorial style, warm natural light, inviting atmosphere,
lifestyle photography, golden hour warmth
```
Best for: Hospitality, wellness, food, real estate

### Bold Industrial
```
documentary photography, dramatic lighting, work in progress,
authentic moment, high contrast, gritty texture
```
Best for: Trades, construction, manufacturing

### Minimal Elegant
```
elegant composition, refined lighting, sophisticated palette,
premium quality, controlled soft diffused light
```
Best for: Luxury brands, boutique services, fashion

### Colour Anchoring
Anchor the colour palette explicitly when generating multiple images:

```
Colour palette: warm terracotta (#C66A52), cream, natural wood.
Background should include terracotta-toned elements to maintain
brand consistency across all images.
```

List 3-4 specific colours or materials. The model picks these up more reliably than abstract terms like "warm tones".

## Aspect Ratios by Platform

| Platform / Use | Ratio | Gemini imageSize |
|---------------|-------|-----------------|
| Website hero (wide) | 16:9 | 2K |
| Website hero (ultra-wide) | 21:9 | 2K |
| Service card | 4:3 | 1K |
| Instagram post | 1:1 | 1K |
| Instagram story | 9:16 | 2K |
| LinkedIn post | 1.91:1 | 1K |
| OG image | 1.91:1 | 1K |
| Profile picture | 1:1 | 1K |
| Pinterest pin | 2:3 | 2K |
| Facebook cover | 2.63:1 | 2K |


## Negative Guidance (Always Include)
End every prompt with constraints. These prevent the most common AI image artifacts:

```
No text, no watermarks, no logos, no writing of any kind.
No extra fingers, no floating objects.
Photorealistic, not illustration or cartoon.
```

For specific domains, add targeted negatives:

| Domain | Add to negatives |
|--------|-----------------|
| Trade/construction | "No hard hat for indoor residential work, no tools left on ladder" |
| Medical/clinical | "No visible patient identification, no non-sterile items in sterile field" |
| Food | "No plastic utensils, no paper plates (unless street food)" |
| Real estate | "No people in the frame, no personal items visible" |
| Australian context | "No American-style architecture, no snow, no fall foliage" |




---
name: ce-gemini-imagegen
description: This skill should be used when generating and editing images using the Gemini API (Nano Banana Pro). It applies when creating images from text prompts, editing existing images, applying style transfers, generating logos with text, creating stickers, product mockups, or any image generation/manipulation task. Supports text-to-image, image editing, multi-turn refinement, and composition from multiple reference images.
---


# Gemini Image Generation (Nano Banana Pro)
Generate and edit images using Google's Gemini API. The environment variable `GEMINI_API_KEY` must be set.

## Default Model

| Model | Resolution | Best For |
|-------|------------|----------|
| `gemini-3-pro-image-preview` | 1K-4K | All image generation (default) |

**Note:** Always use this Pro model. Only use a different model if explicitly requested.

## Quick Reference
### Default Settings
- **Model:** `gemini-3-pro-image-preview`
- **Resolution:** 1K (default, options: 1K, 2K, 4K)
- **Aspect Ratio:** 1:1 (default)

### Available Aspect Ratios
`1:1`, `2:3`, `3:2`, `3:4`, `4:3`, `4:5`, `5:4`, `9:16`, `16:9`, `21:9`

### Available Resolutions
`1K` (default), `2K`, `4K`

## Core API Pattern

```python
import os
from google import genai
from google.genai import types

client = genai.Client(api_key=os.environ["GEMINI_API_KEY"])

# Basic generation (1K, 1:1 - defaults)
response = client.models.generate_content(
    model="gemini-3-pro-image-preview",
    contents=["Your prompt here"],
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
    ),
)

for part in response.parts:
    if part.text:
        print(part.text)
    elif part.inline_data:
        image = part.as_image()
        image.save("output.png")
```

## Custom Resolution & Aspect Ratio

```python
from google.genai import types

response = client.models.generate_content(
    model="gemini-3-pro-image-preview",
    contents=[prompt],
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
        image_config=types.ImageConfig(
            aspect_ratio="16:9",  # Wide format
            image_size="2K"       # Higher resolution
        ),
    )
)
```

### Resolution Examples

```python
# 1K (default) - Fast, good for previews
image_config=types.ImageConfig(image_size="1K")

# 2K - Balanced quality/speed
image_config=types.ImageConfig(image_size="2K")

# 4K - Maximum quality, slower
image_config=types.ImageConfig(image_size="4K")
```

### Aspect Ratio Examples

```python
# Square (default)
image_config=types.ImageConfig(aspect_ratio="1:1")

# Landscape wide
image_config=types.ImageConfig(aspect_ratio="16:9")

# Ultra-wide panoramic
image_config=types.ImageConfig(aspect_ratio="21:9")

# Portrait
image_config=types.ImageConfig(aspect_ratio="9:16")

# Photo standard
image_config=types.ImageConfig(aspect_ratio="4:3")
```

## Editing Images
Pass existing images with text prompts:

```python
from PIL import Image

img = Image.open("input.png")
response = client.models.generate_content(
    model="gemini-3-pro-image-preview",
    contents=["Add a sunset to this scene", img],
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
    ),
)
```

## Multi-Turn Refinement
Use chat for iterative editing:

```python
from google.genai import types

chat = client.chats.create(
    model="gemini-3-pro-image-preview",
    config=types.GenerateContentConfig(response_modalities=['TEXT', 'IMAGE'])
)

response = chat.send_message("Create a logo for 'Acme Corp'")
# Save first image...

response = chat.send_message("Make the text bolder and add a blue gradient")
# Save refined image...
```

## Prompting Best Practices

### Photorealistic Scenes
Include camera details: lens type, lighting, angle, mood.
> "A photorealistic close-up portrait, 85mm lens, soft golden hour light, shallow depth of field"

### Stylized Art
Specify style explicitly:
> "A kawaii-style sticker of a happy red panda, bold outlines, cel-shading, white background"

### Text in Images
Be explicit about font style and placement:
> "Create a logo with text 'Daily Grind' in clean sans-serif, black and white, coffee bean motif"

### Product Mockups
Describe lighting setup and surface:
> "Studio-lit product photo on polished concrete, three-point softbox setup, 45-degree angle"

## Advanced Features
### Google Search Grounding
Generate images based on real-time data:

```python
response = client.models.generate_content(
    model="gemini-3-pro-image-preview",
    contents=["Visualize today's weather in Tokyo as an infographic"],
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
        tools=[{"google_search": {}}]
    )
)
```

### Multiple Reference Images (Up to 14)
Combine elements from multiple sources:

```python
response = client.models.generate_content(
    model="gemini-3-pro-image-preview",
    contents=[
        "Create a group photo of these people in an office",
        Image.open("person1.png"),
        Image.open("person2.png"),
        Image.open("person3.png"),
    ],
    config=types.GenerateContentConfig(
        response_modalities=['TEXT', 'IMAGE'],
    ),
)
```

## Important: File Format & Media Type
**CRITICAL:** The Gemini API returns images in JPEG format by default. When saving, always use `.jpg` extension to avoid media type mismatches.

```python
# CORRECT - Use .jpg extension (Gemini returns JPEG)
image.save("output.jpg")

# WRONG - Will cause "Image does not match media type" errors
image.save("output.png")  # Creates JPEG with PNG extension!
```

### Converting to PNG (if needed)
If you specifically need PNG format:

```python
from PIL import Image

# Generate with Gemini
for part in response.parts:
    if part.inline_data:
        img = part.as_image()
        # Convert to PNG by saving with explicit format
        img.save("output.png", format="PNG")
```

### Verifying Image Format
Check actual format vs extension with the `file` command:

```bash
file image.png
# If output shows "JPEG image data" - rename to .jpg!
```

## Notes
- All generated images include SynthID watermarks
- Gemini returns **JPEG format by default** - always use `.jpg` extension
- Image-only mode (`responseModalities: ["IMAGE"]`) won't work with Google Search grounding
- For editing, describe changes conversationally—the model understands semantic masking
- Default to 1K resolution for speed; use 2K/4K when quality is critical





---
name: nano-banana
description: Google Gemini image generation (Nano Banana) via the Gemini API. Use when user mentions "Nano Banana", "Gemini image generation", "gemini-3-pro-image", "gemini-2.5-flash-image", or wants to generate/edit images with Google's native image model.
---

# Nano Banana (Gemini Image Generation)
Generate and edit images using Google's Gemini native image models. Supports text-to-image, image editing, and multi-image composition via the standard `generateContent` endpoint.
> Official docs: `https://ai.google.dev/gemini-api/docs/image-generation`
---

## When to Use
Use this skill when you need to:
- Generate images from text prompts
- Edit an existing image with a text instruction (inpaint / restyle / add-remove)
- Compose multiple input images into one output (e.g. put a product into a scene)
- Iterate on an image conversationally with fine-grained control

---

## Prerequisites
Connect the **Nano Banana** connector at [app.vm0.ai/connectors](https://app.vm0.ai/connectors). Enabling the connector provisions `NANO_BANANA_TOKEN` — no Google Cloud account or user-supplied key is required.

> **Troubleshooting:** If requests fail, run `zero doctor check-connector --env-name NANO_BANANA_TOKEN` or `zero doctor check-connector --url https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-image:generateContent --method POST`

---

## How to Use

All calls hit `POST https://generativelanguage.googleapis.com/v1beta/models/<model>:generateContent` with header `x-goog-api-key: $NANO_BANANA_TOKEN`. The output image comes back Base64-encoded in `candidates[0].content.parts[*].inline_data.data`.

### 1. Text-to-Image (Flash — fast, cheap default)

Write to `/tmp/nano_banana_request.json`:

```json
{
  "contents": [
    {
      "parts": [
        { "text": "A golden retriever puppy wearing a tiny chef hat, studio lighting, photorealistic" }
      ]
    }
  ]
}
```

```bash
curl -s -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-image:generateContent" --header "x-goog-api-key: $NANO_BANANA_TOKEN" --header "Content-Type: application/json" -d @/tmp/nano_banana_request.json > /tmp/nano_banana_response.json
```

### 2. Text-to-Image (Pro — highest quality)

```bash
curl -s -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-3-pro-image-preview:generateContent" --header "x-goog-api-key: $NANO_BANANA_TOKEN" --header "Content-Type: application/json" -d @/tmp/nano_banana_request.json > /tmp/nano_banana_response.json
```

### 3. Extract and Save the Image

The response contains one or more parts; the image part has `inline_data.mime_type` starting with `image/`. Extract and decode:

```bash
jq -r '.candidates[0].content.parts[] | select(.inline_data != null) | .inline_data.data' /tmp/nano_banana_response.json | base64 -d > /tmp/nano_banana_output.png
```

### 4. Edit an Existing Image (Image-to-Image)

Pass the input image as a second part. Use a local file or URL → Base64:

```bash
base64 -w0 /path/to/input.jpg > /tmp/nano_banana_input_b64.txt
```

Write to `/tmp/nano_banana_request.json`:

```json
{
  "contents": [
    {
      "parts": [
        { "text": "Replace the background with a snowy mountain range at sunset. Keep the subject unchanged." },
        {
          "inline_data": {
            "mime_type": "image/jpeg",
            "data": "<PASTE_CONTENTS_OF_/tmp/nano_banana_input_b64.txt>"
          }
        }
      ]
    }
  ]
}
```

Or build the JSON with `jq` to avoid pasting:

```bash
jq -n --rawfile img /tmp/nano_banana_input_b64.txt '{
  contents: [{
    parts: [
      { text: "Replace the background with a snowy mountain range at sunset. Keep the subject unchanged." },
      { inline_data: { mime_type: "image/jpeg", data: $img } }
    ]
  }]
}' > /tmp/nano_banana_request.json
```

```bash
curl -s -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-image:generateContent" --header "x-goog-api-key: $NANO_BANANA_TOKEN" --header "Content-Type: application/json" -d @/tmp/nano_banana_request.json > /tmp/nano_banana_response.json
```

### 5. Multi-Image Composition

Combine multiple input images into one output — e.g. put a product (image A) into a scene (image B):

```bash
jq -n \
  --rawfile a /tmp/product_b64.txt \
  --rawfile b /tmp/scene_b64.txt \
  '{
    contents: [{
      parts: [
        { text: "Place the product from the first image onto the wooden table in the second image. Match the lighting and shadows." },
        { inline_data: { mime_type: "image/png", data: $a } },
        { inline_data: { mime_type: "image/jpeg", data: $b } }
      ]
    }]
  }' > /tmp/nano_banana_request.json

curl -s -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-3-pro-image-preview:generateContent" --header "x-goog-api-key: $NANO_BANANA_TOKEN" --header "Content-Type: application/json" -d @/tmp/nano_banana_request.json > /tmp/nano_banana_response.json
```

### 6. Control Output Modalities and Aspect Ratio

Gemini can return text alongside images. To request image-only output and a specific aspect ratio, add `generationConfig`:

```json
{
  "contents": [
    { "parts": [{ "text": "A minimalist poster for a jazz festival" }] }
  ],
  "generationConfig": {
    "responseModalities": ["IMAGE"],
    "imageConfig": {
      "aspectRatio": "16:9",
      "imageSize": "2K"
    }
  }
}
```

```bash
curl -s -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-image:generateContent" --header "x-goog-api-key: $NANO_BANANA_TOKEN" --header "Content-Type: application/json" -d @/tmp/nano_banana_request.json > /tmp/nano_banana_response.json
```

### 7. Conversational Editing (Multi-Turn Refinement)

Continue refining by appending the previous model turn and a new user message. Reuse the Base64 image the model returned so you don't re-upload:

```bash
PREV_IMG=$(jq -r '.candidates[0].content.parts[] | select(.inline_data != null) | .inline_data.data' /tmp/nano_banana_response.json)

jq -n --arg img "$PREV_IMG" '{
  contents: [
    { role: "user",  parts: [{ text: "A minimalist poster for a jazz festival" }] },
    { role: "model", parts: [{ inline_data: { mime_type: "image/png", data: $img } }] },
    { role: "user",  parts: [{ text: "Make the typography bolder and shift the palette to deep blue and gold." }] }
  ]
}' > /tmp/nano_banana_request.json

curl -s -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-image:generateContent" --header "x-goog-api-key: $NANO_BANANA_TOKEN" --header "Content-Type: application/json" -d @/tmp/nano_banana_request.json > /tmp/nano_banana_response.json
```

### 8. Inspect Any Text the Model Returns

The model may include a short text caption/explanation alongside the image:

```bash
jq -r '.candidates[0].content.parts[] | select(.text != null) | .text' /tmp/nano_banana_response.json
```

---

## Model Reference

| Model | Tier | Notes |
|---|---|---|
| `gemini-2.5-flash-image` | Fast | Default — good quality, low latency |
| `gemini-3.1-flash-image-preview` | Fast (newer) | Latest Flash preview |
| `gemini-3-pro-image-preview` | Pro | Highest quality, higher latency/cost |

## Aspect Ratios

`1:1`, `2:3`, `3:2`, `3:4`, `4:3`, `4:5`, `5:4`, `9:16`, `16:9`, `21:9`, `1:4`, `4:1`, `1:8`, `8:1`.

## Image Size

`generationConfig.imageConfig.imageSize` — `"512"`, `"1K"` (default), `"2K"`, `"4K"`. Larger sizes cost more and are only relevant to final renders; keep iteration at `1K`.

## Response Shape

```json
{
  "candidates": [{
    "content": {
      "parts": [
        { "text": "Optional caption..." },
        { "inline_data": { "mime_type": "image/png", "data": "<base64>" } }
      ]
    },
    "finishReason": "STOP"
  }]
}
```

## Guidelines

1. **Endpoint is per-model** — the URL ends with `<model>:generateContent`. Don't try `/v1beta/models:generateContent` with a `model` field in the body; the firewall only allows the per-model endpoints.
2. **Use JSON files for request bodies** — write to `/tmp/nano_banana_*.json` to avoid shell quoting issues with long prompts and Base64 payloads.
3. **Always `base64 -w0`** when preparing Linux image input — `base64` without `-w0` inserts newlines that break JSON escaping.
4. **Output is Base64, never a URL** — decode `inline_data.data` and write bytes directly to disk. The `mime_type` tells you the extension (`png` / `jpeg` / `webp`).
5. **Prefer Flash** for iteration, switch to Pro for finals — Flash turns around in a few seconds; Pro is noticeably slower but sharper on text, hands, and fine detail.
6. **Keep prompts concrete** — describe subject, style, lighting, composition, and mood. For edits, say what to change and what to keep.
7. **Input image size** — downscale very large inputs before Base64-encoding; the full round-trip cost scales with payload size.






---
name: nano-banana-edit
displayName: "Nano Banana Edit — Pro Pack on RunComfy"
description: >
  Edit images with Google Nano Banana 2 (image-to-image edit endpoint)
  on RunComfy. Documents Nano Banana Edit's strengths (preserve subject
  identity, swap background, localize edits with spatial language,
  multi-image batch edits up to 20 inputs), the schema, and when to
  route to GPT Image 2 edit / Flux Kontext / Nano Banana 2 t2i instead.
  Calls `runcomfy run google/nano-banana-2/edit` through the local
  RunComfy CLI. Triggers on "nano banana edit", "edit with nano banana",
  "image edit nano banana", or any explicit ask to edit with this model.
homepage: https://www.runcomfy.com
license: MIT
---


# Nano Banana Edit — Pro Pack on RunComfy

[runcomfy.com](https://www.runcomfy.com/?utm_source=skills.sh&utm_medium=skill&utm_campaign=nano-banana-edit) · [Edit endpoint](https://www.runcomfy.com/models/google/nano-banana-2/edit?utm_source=skills.sh&utm_medium=skill&utm_campaign=nano-banana-edit) · [GitHub](https://github.com/agentspace-so/runcomfy-skills/tree/main/nano-banana-edit)

Google **Nano Banana 2 Edit** — the image-to-image edit endpoint of the Gemini-family flash-tier image model — hosted on the **RunComfy Model API**. Up to **20 input images per call** for batch edits and multi-reference variation.

```bash
npx skills add agentspace-so/runcomfy-skills --skill nano-banana-edit -g
```

## When to pick this model (vs siblings)

| You want | Use |
|---|---|
| Preserve subject identity, swap background or clothing | **Nano Banana Edit** |
| Edit up to 20 images consistently in one batch | **Nano Banana Edit** |
| Localize edit to "X only" with spatial language | **Nano Banana Edit** |
| Edit multilingual text inside the image (signs, labels) | GPT Image 2 edit |
| Single ref + precise local edit ("she's now holding X") | Flux Kontext |
| Generate a new image from scratch | Nano Banana 2 t2i (sibling skill) |

If the user said "nano banana edit" / "edit with nano banana" explicitly, route here regardless.

## Prerequisites

1. **RunComfy CLI** — `npm i -g @runcomfy/cli`
2. **RunComfy account** — `runcomfy login` opens a browser device-code flow.
3. **CI / containers** — set `RUNCOMFY_TOKEN=<token>` instead of `runcomfy login`.

## Endpoints + input schema
### `google/nano-banana-2/edit`

| Field | Type | Required | Default | Notes |
|---|---|---|---|---|
| `prompt` | string | yes | — | Edit instruction. Lead with preservation, end with the change. |
| `image_urls` | array | yes | — | **1–20** publicly-fetchable HTTPS URLs. |
| `number_of_images` | int | no | 1 | 1–4 outputs per call. |
| `seed` | int | no | — | Reproducibility. |
| `aspect_ratio` | enum | no | `auto` | `auto` (follows input) or fixed ratios — lock for batch consistency. |
| `resolution` | enum | no | `1K` | `0.5K` / `1K` / `2K` / `4K`. |
| `output_format` | enum | no | `png` | `png` / `jpeg` / `webp`. |
| `safety_tolerance` | int | no | 4 | 1 (strict) – 6 (permissive). |
| `limit_generations` | bool | no | — | If true, restricts each round to one output. |
| `enable_web_search` | bool | no | false | Web grounding (extra cost / latency). |

## How to invoke
**Single-image background swap, identity preserved:**

```bash
runcomfy run google/nano-banana-2/edit \
  --input '{
    "prompt": "Keep the subject identity, pose, and clothing unchanged. Convert the background into a rainy neon cyberpunk street.",
    "image_urls": ["https://.../portrait.jpg"]
  }' \
  --output-dir <absolute/path>
```

**Batch edit with locked framing:**

```bash
runcomfy run google/nano-banana-2/edit \
  --input '{
    "prompt": "Replace the watermark in the bottom-right with the text \"AURA\" in clean white sans-serif. Keep everything else exactly as in the input.",
    "image_urls": ["https://.../sku-1.jpg", "https://.../sku-2.jpg", "https://.../sku-3.jpg"],
    "aspect_ratio": "1:1",
    "resolution": "1K"
  }' \
  --output-dir <absolute/path>
```

**Targeted spatial edit ("left object only"):**

```bash
runcomfy run google/nano-banana-2/edit \
  --input '{
    "prompt": "Remove the leftmost object only. Keep the right two objects, the table, and the lighting unchanged.",
    "image_urls": ["https://.../still-life.jpg"]
  }' \
  --output-dir <absolute/path>
```

## Prompting — what actually works

**Preservation first, change last.** Always lead with `"Keep [identity / pose / clothing / brand / framing] unchanged."` Then state the change in one clean sentence. Models honor what's stated up front; tail-end preservations get ignored.

**Localize with spatial language.** "background only", "the left object", "the upper-right corner", "above the headline" — concrete spatial scopes are honored. "make it more X" is vague and drifts.

**Batch consistency** — when editing a series, lock `aspect_ratio` and `resolution`. Use the same prompt grammar across the batch so each output reads as a sibling, not a remix.

**Iterate small.** If a one-pass edit drifts, split into two: pass 1 changes background only, pass 2 swaps the subject's outfit. Cleaner edits, same total cost (assuming similar resolution).

**Multi-image variation** — pass up to 20 inputs to get a coherent batch. Useful for SKU galleries, A/B testing, character sheet variations.

**Anti-patterns:**
- Long compound instructions ("change A and B and C and D") — drift increases per added scope.
- Edit instructions written in passive voice ("the background should be changed") — be imperative.
- Missing preservation goals — model will subtly rewrite the face / brand.
- Aspect ratios that don't match input — causes crops or stretches.

## Where it shines

| Use case | Why Nano Banana Edit |
|---|---|
| **SKU gallery — same product on different backgrounds** | Batch of 20, identity-preserved, framing locked |
| **Influencer / spokesperson background swaps** | Strong identity preservation across edits |
| **Localized object removal / addition** | Spatial language honored |
| **A/B variants for ad creative** | Seed lock + multiple `number_of_images` |
| **Brand-asset relocalization** | Same composition with text / palette swap |

## Sample prompts (verified to produce strong results)

**Background swap (page example):**

```
Keep the subject identity unchanged. Convert the background into a rainy
neon cyberpunk street.
```

**Targeted text replacement:**

```
Keep the bottle, label, and lighting exactly as in the input.
Replace only the brand text on the label from "ALPHA" to "AURA",
same font weight, centered, white on black.
```

**Multi-image batch consistency:**

```
For each input image: keep the subject's pose and identity unchanged.
Convert the background to a soft warm-grey studio sweep with subtle
floor shadow. Center the subject at the same fraction of frame as the
input.
```

## Limitations

- **1–20 input images per call** — the first is treated as primary; the rest provide auxiliary cues.
- **1–4 outputs per call.**
- **Long compound prompts drift** — split into multiple passes.
- **Web search adds latency + cost** — only enable on demand.
- **For multilingual in-image text edits, GPT Image 2 edit wins.**

## Exit codes

| code | meaning |
|---|---|
| 0  | success |
| 64 | bad CLI args |
| 65 | bad input JSON / schema mismatch |
| 69 | upstream 5xx |
| 75 | retryable: timeout / 429 |
| 77 | not signed in or token rejected |

Full reference: [docs.runcomfy.com/cli/troubleshooting](https://docs.runcomfy.com/cli/troubleshooting?utm_source=skills.sh&utm_medium=skill&utm_campaign=nano-banana-edit).

## How it works
The skill invokes `runcomfy run google/nano-banana-2/edit` with a JSON body matching the schema. The CLI POSTs to `https://model-api.runcomfy.net/v1/models/google/nano-banana-2/edit`, polls the request, fetches the result, and downloads any `.runcomfy.net`/`.runcomfy.com` URL into `--output-dir`. `Ctrl-C` cancels the remote request before exit.

## Security & Privacy
- **Token storage**: `runcomfy login` writes the API token to `~/.config/runcomfy/token.json` with mode 0600 (owner-only read/write). Set `RUNCOMFY_TOKEN` env var to bypass the file entirely in CI / containers.
- **Input boundary**: the user prompt is passed as a JSON string to the CLI via `--input`. The CLI does NOT shell-expand the prompt; it transmits the JSON body directly to the Model API over HTTPS. No shell injection surface from prompt content.
- **Third-party content**: image / mask / video URLs you pass are fetched by the RunComfy model server, not by the CLI on your machine. Treat external URLs as untrusted; image-based prompt injection is a known risk for any image-edit / video-edit model.
- **Outbound endpoints**: only `model-api.runcomfy.net` (request submission) and `*.runcomfy.net` / `*.runcomfy.com` (download whitelist for generated outputs). No telemetry, no callbacks.
- **Generated-file size cap**: the CLI aborts any single download > 2 GiB to prevent disk-fill from a malicious or runaway model output.


---
name: nano-banana-2
displayName: "Nano Banana 2 — Pro Pack on RunComfy"
description: >
  Generate images with Google Nano Banana 2 (Gemini-family flash-tier
  text-to-image) on RunComfy — bundled with the model's documented
  prompting patterns so the skill gets sharper output than naive
  prompting against the same model. Documents Nano Banana 2's strengths
  (rapid iteration, in-image typography rendering, predictable framing,
  optional web-grounded context), the resolution-tier pricing, the
  safety-tolerance dial, and when to route to Nano Banana Pro / GPT
  Image 2 / Flux 2 / Seedream instead. Calls
  `runcomfy run google/nano-banana-2/text-to-image` through the local
  RunComfy CLI. Triggers on "nano banana", "nano-banana-2", "nano banana 2",
  "google image gen", "gemini image", or any explicit ask to generate
  with this model.
homepage: https://www.runcomfy.com
license: MIT
---

# Nano Banana 2 — Pro Pack on RunComfy

[runcomfy.com](https://www.runcomfy.com/?utm_source=skills.sh&utm_medium=skill&utm_campaign=nano-banana-2) · [Model page](https://www.runcomfy.com/models/google/nano-banana-2?utm_source=skills.sh&utm_medium=skill&utm_campaign=nano-banana-2) · [GitHub](https://github.com/agentspace-so/runcomfy-skills/tree/main/nano-banana-2)

Google **Nano Banana 2** — the flash-tier text-to-image model in the Gemini family — hosted on the **RunComfy Model API**. Optimized for ideation, social-thumbnail batches, and rapid drafts with strong in-image typography.

```bash
npx skills add agentspace-so/runcomfy-skills --skill nano-banana-2 -g
```

## When to pick this model (vs siblings)
Nano Banana 2 is the **flash-tier** of the Google image-gen line. Pick it when iteration speed and predictable framing matter more than maximum detail.

| You want | Use |
|---|---|
| Rapid drafts, social thumbnails, batch variants | **Nano Banana 2** |
| In-image typography with predictable rendering | **Nano Banana 2** |
| Web-grounded image (current events / real entities) | **Nano Banana 2** + `enable_web_search` |
| Image **edit** (preserve subject, swap background) | **Nano Banana Edit** (sibling skill) |
| Heavy stylization, painterly look | Flux 2 |
| Maximum prompt adherence + multilingual text | GPT Image 2 |
| 2K–4K hero shots, max realism | Seedream 5 |
| Hyperrealistic portrait | Nano Banana Pro |

If the user said "Nano Banana" / "nano-banana-2" / "Gemini image" explicitly, route here regardless. If they said "Nano Banana" without specifying 2 vs Pro, default to **Pro** for portraits and **2** for everything else.

## Prerequisites

1. **RunComfy CLI** — `npm i -g @runcomfy/cli`
2. **RunComfy account** — `runcomfy login` opens a browser device-code flow.
3. **CI / containers** — set `RUNCOMFY_TOKEN=<token>` instead of `runcomfy login`.

## Endpoints + input schema
### `google/nano-banana-2/text-to-image`

| Field | Type | Required | Default | Notes |
|---|---|---|---|---|
| `prompt` | string | yes | — | Subject-first description. |
| `num_images` | int | no | 1 | 1–4. Use 4 for ideation rounds. |
| `seed` | int | no | 0 | Reuse for reproducibility. |
| `aspect_ratio` | enum | no | `auto` | `auto`, `21:9`, `16:9`, `3:2`, `4:3`, `5:4`, `1:1`, `4:5`, `3:4`, `2:3`, `9:16`. |
| `resolution` | enum | no | `1K` | `0.5K` (drafts), `1K` (default), `2K` (final), `4K` (max). |
| `output_format` | enum | no | `png` | `png`, `jpeg`, `webp`. |
| `safety_tolerance` | int | no | 4 | 1 (strict) – 6 (permissive). |
| `limit_generations` | bool | no | true | Limit each prompt round to one generation. |
| `enable_web_search` | bool | no | false | Adds web grounding (extra cost + latency). |

For image edit (preserve subject + apply changes), see the sibling [`nano-banana-edit`](../nano-banana-edit) skill.

## How to invoke

**Default draft (1K, square, png):**

```bash
runcomfy run google/nano-banana-2/text-to-image \
  --input '{"prompt": "<user prompt>"}' \
  --output-dir <absolute/path>
```

**Vertical 4-up batch for ideation:**

```bash
runcomfy run google/nano-banana-2/text-to-image \
  --input '{
    "prompt": "<user prompt>",
    "num_images": 4,
    "aspect_ratio": "9:16",
    "resolution": "0.5K"
  }' \
  --output-dir <absolute/path>
```

**Final at 2K with seed lock:**

```bash
runcomfy run google/nano-banana-2/text-to-image \
  --input '{
    "prompt": "<user prompt>",
    "resolution": "2K",
    "aspect_ratio": "16:9",
    "seed": 42
  }' \
  --output-dir <absolute/path>
```

**Web-grounded (current event / real entity):**

```bash
runcomfy run google/nano-banana-2/text-to-image \
  --input '{
    "prompt": "<prompt referencing a real-world event from this week>",
    "enable_web_search": true
  }' \
  --output-dir <absolute/path>
```

## Prompting — what actually works

**Subject-first declarative grammar.** "A cinematic close-up portrait of an American woman standing under neon lights in rainy Tokyo, shallow depth of field, reflective wet streets, ultra-detailed, realistic skin texture" — primary subject, then action, environment, style, camera. Front-load subject; trail with directives.

**Exact text quoting for in-image typography.** "The label reads 'AURA' in clean bold sans-serif, centered, white on black" — quote the literal characters. Specify placement and font style. Don't say "with the brand name on it" and hope.

**Consistent seeds for refinement.** Lock `seed` when iterating a single prompt across small variants — keeps composition stable.

**Web-grounding, sparingly.** Turn on `enable_web_search` only when the prompt names current events / real entities. Adds latency + cost; off by default.

**Don't conflict styles.** "minimalist + ornate + retro + cyberpunk" cancels. Pick 1–2 anchors.

**Anti-patterns:**
- Trying to verbally describe a stable subject identity — use the **edit** endpoint with image refs instead.
- Asking for resolutions outside the 4 tiers → 422.
- Aspect ratios outside the 11 supported values → 422.
- Non-quoted in-image text → unpredictable rendering.

## Where it shines

| Use case | Why Nano Banana 2 |
|---|---|
| **Marketing draft thumbnails (batch of 4)** | Fast iteration at 0.5K, then promote winner to 2K |
| **Social-platform-native** | Wide aspect ratio support including 9:16, 4:5, 21:9 |
| **In-image typography for posters / cards** | Predictable text rendering when characters are quoted |
| **Web-grounded current-event imagery** | `enable_web_search` integrates fresh info |
| **Reproducible variant testing** | Strong seed + consistent framing |

## Sample prompts (verified to produce strong results)
**Cinematic portrait (page example):**

```
A cinematic close-up portrait of an American woman standing under neon
lights in rainy Tokyo, shallow depth of field, reflective wet streets,
ultra-detailed, realistic skin texture
```

**Brand-asset card with quoted text:**

```
A minimalist 16:9 product card: a matte black ceramic mug centered on a
soft warm-grey paper background, rim highlight from upper-left, the
headline "Brewed Quietly" in clean bold sans-serif top-right, balanced
negative space below, e-commerce ready, clean studio lighting
```

**Vertical platform-native:**

```
A 9:16 vertical hero for a wellness brand: a single ceramic teacup on a
linen runner, soft morning side-light, the words "Slow Down" in
hand-drawn serif large at the top, gentle steam rising, neutral color
palette, uncluttered
```

## Limitations

- **Still images only.** No video on this endpoint.
- **Max 4 outputs per request.**
- **Web search adds latency + cost** — only enable on demand.
- **2K / 4K cost more** — default to 1K unless user asked for higher.
- **For image edit, use the `/edit` endpoint** — not this one.

## Exit codes

| code | meaning |
|---|---|
| 0  | success |
| 64 | bad CLI args |
| 65 | bad input JSON / schema mismatch |
| 69 | upstream 5xx |
| 75 | retryable: timeout / 429 |
| 77 | not signed in or token rejected |

Full reference: [docs.runcomfy.com/cli/troubleshooting](https://docs.runcomfy.com/cli/troubleshooting?utm_source=skills.sh&utm_medium=skill&utm_campaign=nano-banana-2).

## How it works

The skill invokes `runcomfy run google/nano-banana-2/text-to-image` with a JSON body matching the schema. The CLI POSTs to `https://model-api.runcomfy.net/v1/models/google/nano-banana-2/text-to-image`, polls the request, fetches the result, and downloads any `.runcomfy.net`/`.runcomfy.com` URL into `--output-dir`. `Ctrl-C` cancels the remote request before exit.

## Security & Privacy

- **Token storage**: `runcomfy login` writes the API token to `~/.config/runcomfy/token.json` with mode 0600 (owner-only read/write). Set `RUNCOMFY_TOKEN` env var to bypass the file entirely in CI / containers.
- **Input boundary**: the user prompt is passed as a JSON string to the CLI via `--input`. The CLI does NOT shell-expand the prompt; it transmits the JSON body directly to the Model API over HTTPS. No shell injection surface from prompt content.
- **Third-party content**: image / mask / video URLs you pass are fetched by the RunComfy model server, not by the CLI on your machine. Treat external URLs as untrusted; image-based prompt injection is a known risk for any image-edit / video-edit model.
- **Outbound endpoints**: only `model-api.runcomfy.net` (request submission) and `*.runcomfy.net` / `*.runcomfy.com` (download whitelist for generated outputs). No telemetry, no callbacks.
- **Generated-file size cap**: the CLI aborts any single download > 2 GiB to prevent disk-fill from a malicious or runaway model output.





---
name: nano-banana-2
description: "Generate images with Google Gemini 3.1 Flash Image Preview (Nano Banana 2) via inference.sh CLI. Capabilities: text-to-image, image editing, multi-image input (up to 14 images), Google Search grounding. Triggers: nano banana 2, nanobanana 2, gemini 3.1 flash image, gemini 3 1 flash image preview, google image generation"
allowed-tools: Bash(belt *)
---

> **Install the belt CLI skill:** `npx skills add belt-sh/cli`

# Nano Banana 2 - Gemini 3.1 Flash Image Preview

Generate images with Google Gemini 3.1 Flash Image Preview via [inference.sh](https://inference.sh) CLI.

## Quick Start

> Requires inference.sh CLI (`belt`). [Install instructions](https://raw.githubusercontent.com/inference-sh/skills/refs/heads/main/cli-install.md)

```bash
belt login

belt app run google/gemini-3-1-flash-image-preview --input '{"prompt": "a banana in space, photorealistic"}'
```


## Examples

### Basic Text-to-Image

```bash
belt app run google/gemini-3-1-flash-image-preview --input '{
  "prompt": "A futuristic cityscape at sunset with flying cars"
}'
```

### Multiple Images

```bash
belt app run google/gemini-3-1-flash-image-preview --input '{
  "prompt": "Minimalist logo design for a coffee shop",
  "num_images": 4
}'
```

### Custom Aspect Ratio

```bash
belt app run google/gemini-3-1-flash-image-preview --input '{
  "prompt": "Panoramic mountain landscape with northern lights",
  "aspect_ratio": "16:9"
}'
```

### Image Editing (with input images)

```bash
belt app run google/gemini-3-1-flash-image-preview --input '{
  "prompt": "Add a rainbow in the sky",
  "images": ["https://example.com/landscape.jpg"]
}'
```

### High Resolution (4K)

```bash
belt app run google/gemini-3-1-flash-image-preview --input '{
  "prompt": "Detailed illustration of a medieval castle",
  "resolution": "4K"
}'
```

### With Google Search Grounding

```bash
belt app run google/gemini-3-1-flash-image-preview --input '{
  "prompt": "Current weather in Tokyo visualized as an artistic scene",
  "enable_google_search": true
}'
```

## Input Options

| Parameter | Type | Description |
|-----------|------|-------------|
| `prompt` | string | **Required.** What to generate or change |
| `images` | array | Input images for editing (up to 14). Supported: JPEG, PNG, WebP |
| `num_images` | integer | Number of images to generate |
| `aspect_ratio` | string | Output ratio: "1:1", "16:9", "9:16", "4:3", "3:4", "auto" |
| `resolution` | string | "1K", "2K", "4K" (default: 1K) |
| `output_format` | string | Output format for images |
| `enable_google_search` | boolean | Enable real-time info grounding (weather, news, etc.) |

## Output

| Field | Type | Description |
|-------|------|-------------|
| `images` | array | The generated or edited images |
| `description` | string | Text description or response from the model |
| `output_meta` | object | Metadata about inputs/outputs for pricing |

## Prompt Tips

**Styles**: photorealistic, illustration, watercolor, oil painting, digital art, anime, 3D render

**Composition**: close-up, wide shot, aerial view, macro, portrait, landscape

**Lighting**: natural light, studio lighting, golden hour, dramatic shadows, neon

**Details**: add specific details about textures, colors, mood, atmosphere

## Sample Workflow

```bash
# 1. Generate sample input to see all options
belt app sample google/gemini-3-1-flash-image-preview --save input.json

# 2. Edit the prompt
# 3. Run
belt app run google/gemini-3-1-flash-image-preview --input input.json
```

## Python SDK

```python
from inferencesh import inference

client = inference()

# Basic generation
result = client.run({
    "app": "google/gemini-3-1-flash-image-preview@0c7ma1ex",
    "input": {
        "prompt": "A banana in space, photorealistic"
    }
})
print(result["output"])

# Stream live updates
for update in client.run({
    "app": "google/gemini-3-1-flash-image-preview@0c7ma1ex",
    "input": {
        "prompt": "A futuristic cityscape at sunset"
    }
}, stream=True):
    if update.get("progress"):
        print(f"progress: {update['progress']}%")
    if update.get("output"):
        print(f"output: {update['output']}")
```

## Related Skills

```bash
# Original Nano Banana (Gemini 3 Pro Image, Gemini 2.5 Flash Image)
npx skills add inference-sh/skills@nano-banana

# Full platform skill (all 250+ apps)
npx skills add inference-sh/skills@infsh-cli

# All image generation models
npx skills add inference-sh/skills@ai-image-generation
```

Browse all image apps: `belt app store --category image`

## Documentation

- [Running Apps](https://inference.sh/docs/apps/running) - How to run apps via CLI
- [Streaming Results](https://inference.sh/docs/api/sdk/streaming) - Real-time progress updates
- [File Handling](https://inference.sh/docs/api/sdk/files) - Working with images







---
name: flux-image
description: "Generate images with FLUX models (Black Forest Labs) via inference.sh CLI. Models: FLUX Dev LoRA, FLUX.2 Klein LoRA with custom style adaptation. Capabilities: text-to-image, image-to-image, LoRA fine-tuning, custom styles. Triggers: flux, flux.2, flux dev, flux schnell, flux pro, black forest labs, flux image, flux ai, flux model, flux lora"
allowed-tools: Bash(belt *)
---

> **Install the belt CLI skill:** `npx skills add belt-sh/cli`

# FLUX Image Generation

Generate images with FLUX models via [inference.sh](https://inference.sh) CLI.

![FLUX Image Generation](https://cloud.inference.sh/app/files/u/4mg21r6ta37mpaz6ktzwtt8krr/01kg0v0nz7wv0qwqjtq1cam52z.jpeg)

## Quick Start

> Requires inference.sh CLI (`belt`). [Install instructions](https://raw.githubusercontent.com/inference-sh/skills/refs/heads/main/cli-install.md)

```bash
belt login

belt app run falai/flux-dev-lora --input '{"prompt": "a futuristic city at night"}'
```


## FLUX Models

| Model | App ID | Speed | Quality | Use Case |
|-------|--------|-------|---------|----------|
| FLUX Dev LoRA | `falai/flux-dev-lora` | Medium | Highest | Production, custom styles |
| FLUX.2 Klein LoRA | `falai/flux-2-klein-lora` | Fastest | Good | Fast iteration, 4B/9B sizes |
| **FLUX Dev (Pruna)** | `pruna/flux-dev` | Fast | High | Optimized, speed modes |
| **FLUX Dev LoRA (Pruna)** | `pruna/flux-dev-lora` | Fast | High | LoRA with optimization |
| **FLUX Klein 4B (Pruna)** | `pruna/flux-klein-4b` | Fastest | Good | Ultra-cheap ($0.0001/img) |

## Examples

### High-Quality Generation

```bash
belt app run falai/flux-dev-lora --input '{
  "prompt": "professional product photo of headphones, studio lighting, white background"
}'
```

### Fast Generation (Klein)

```bash
belt app run falai/flux-2-klein-lora --input '{"prompt": "abstract art, colorful"}'
```

### With LoRA Custom Styles

```bash
belt app sample falai/flux-dev-lora --save input.json

# Edit to add lora_url for custom style
belt app run falai/flux-dev-lora --input input.json
```

### Image-to-Image

```bash
belt app run falai/flux-dev-lora --input '{
  "prompt": "transform to watercolor style",
  "image_url": "https://your-image.jpg"
}'
```

## For Other Image Tasks

```bash
# Image editing with natural language
belt app run falai/reve --input '{"prompt": "change background to beach"}'

# Upscaling
belt app run falai/topaz-image-upscaler --input '{"image_url": "https://..."}'
```

## Related Skills

```bash
# Full platform skill (all 250+ apps)
npx skills add inference-sh/skills@infsh-cli

# Pruna P-Image (fast & economical)
npx skills add inference-sh/skills@p-image

# All image generation models
npx skills add inference-sh/skills@ai-image-generation

# Upscaling
npx skills add inference-sh/skills@image-upscaling
```

Browse all apps: `belt app store`

## Documentation

- [Running Apps](https://inference.sh/docs/apps/running) - How to run apps via CLI
- [Image Generation Example](https://inference.sh/docs/examples/image-generation) - Complete image generation guide
- [Streaming Results](https://inference.sh/docs/api/sdk/streaming) - Real-time progress updates





---
name: background-removal
description: "Remove backgrounds from images with BiRefNet via inference.sh CLI. Model: BiRefNet (high accuracy background removal). Use for: product photos, portraits, e-commerce, transparent PNGs, photo editing. Triggers: remove background, background removal, remove bg, transparent background, cut out image, background remover, rembg, product photo editing, cutout, transparent png, bg removal, photo cutout"
allowed-tools: Bash(belt *)
---


## OUTPUT TYPE C: ISOLATED TRANSPARENT COMPONENT
If the user requests an isolated logo, cutout icon, standalone product schematic, or floating architectural component:

- **Style:** Clean isolated subject with zero environmental interference.
- **Workflow:** 
- 
  1. Trigger generation via a text-to-image app with a solid, contrasting white background.
  2. IMMEDIATELY call the `inference-sh/background-removal` tool using the generated image URL as the payload.
  3. Output the final transparent PNG cutout.

 
 | Model Name | API ID | Provider | Primary Strength |
| --- | --- | --- | --- |
| **Reve Image 2.0** | `falai/reve` | Fal.ai / Reve | **Layout-aware 4K editing, transparent cutouts, and seamless environmental context swapping.** |
| **Imagen 4 Ultra** | `google/imagen4-ultra/text-to-image` | Google AI | Standalone peak photorealism and studio macro-photography. |
| **FLUX.1 [dev] LoRA** | `falai/flux-dev-lora` | Fal.ai / BFL | Hyper-precise style adherence, textures, and complex structural prompt following. |
| **FLUX 2 Klein** | `falai/flux-2-klein-lora` | Fal.ai / BFL | Distilled, lightning-fast generation (2-3 seconds) for rapid visual brainstorming. |
| **Gemini 3 Pro Image** | `gemini-3-pro-image-preview` | Google AI | Highly contextual native conversational asset generation inside the agent chat. |


## POST-PROCESSING PIPELINE
- If the user appends instructions like "remove background," "make transparent," or "isolate object," do not re-generate the entire image.
- Pass the current asset URL straight to the background removal app.


> **Install the belt CLI skill:** `npx skills add belt-sh/cli`

# Background Removal
Remove backgrounds from images via [inference.sh](https://inference.sh) CLI.

![Background Removal](https://cloud.inference.sh/u/33sqbmzt3mrg2xxphnhw5g5ear/01k8d7y07rpmnv85hz2xvhjvbb.png)

## Quick Start
> Requires inference.sh CLI (`belt`). [Install instructions](https://raw.githubusercontent.com/inference-sh/skills/refs/heads/main/cli-install.md)

```bash
belt login

belt app run infsh/birefnet --input '{"image_url": "https://your-photo.jpg"}'
```

## How To
Use Reve for image editing including background changes:

```bash
belt app run falai/reve --input '{
  "prompt": "remove the background, make it transparent",
  "image_url": "https://portrait.jpg"
}'
```

Or change background directly:

```bash
belt app run falai/reve --input '{
  "prompt": "change the background to a beach",
  "image_url": "https://product-photo.jpg"
}'
```

## Workflow: Generate and Edit

```bash
# 1. Generate an image
belt app run falai/flux-dev-lora --input '{"prompt": "a cute robot mascot"}' > robot.json

# 2. Edit with Reve
belt app run falai/reve --input '{
  "prompt": "remove background, transparent",
  "image_url": "<url-from-step-1>"
}'
```

## Use Cases

- **E-commerce**: Clean product photos
- **Portraits**: Professional headshots
- **Marketing**: Assets for design
- **Social Media**: Profile pictures
- **Design**: Elements for compositions

## Output
Returns a PNG with transparent background.

## Related Skills

```bash
# Full platform skill (all 250+ apps)
npx skills add inference-sh/skills@infsh-cli

# Image generation
npx skills add inference-sh/skills@ai-image-generation

# FLUX models (including inpainting)
npx skills add inference-sh/skills@flux-image

# Upscaling
npx skills add inference-sh/skills@image-upscaling
```

Browse all image apps: `belt app store --category image`


## Documentation
- [Running Apps](https://inference.sh/docs/apps/running) - How to run apps via CLI
- [Image Generation Example](https://inference.sh/docs/examples/image-generation) - Complete image workflow guide
- [Apps Overview](https://inference.sh/docs/apps/overview) - Understanding the app ecosystem





# Minimalist Image Director

> Art direction framework for generating warm minimalist photography via AI image generators (Flux, Midjourney, DALL-E). Separates compositional minimalism from emotional minimalism to avoid the "beautiful but sad" trap.

## When to Use This Skill

- Generating hero images, card images, or blog illustrations for a website
- Creating a cohesive visual identity across 10+ AI-generated images
- Briefing AI image generators (Replicate/Flux, Midjourney, DALL-E) with emotional precision
- When previous minimalist attempts came back "too cold" or "too sad"
- Building a visual style guide for a brand's AI-generated photography

## Methodology Foundation

**Sources**:
- Editorial photography principles (Annie Leibovitz, minimal lifestyle photography trend 2024-2026)
- Emotional Design (Don Norman, 2004) — visceral, behavioral, reflective processing
- Color psychology research — warm tones (2700-3000K) activate approach behaviors, cool tones trigger avoidance
- Neuroscience of visual-thermal perception — 80% of experiments show visual environment manipulation affects thermal perception (red-orange = warmth, green-blue = cold)
- Black Forest Labs official prompting guides (Flux 1.1 Pro, Flux 2)
- Kodak Portra 400 color science — the gold standard for warm skin tones in AI photography

**Core Principle**: Minimalism is about what you KEEP, not what you REMOVE. The fewer elements in a frame, the more each one must carry emotional weight. Empty space amplifies — it amplifies warmth just as easily as coldness.

**Why This Matters**: AI image generators default to "aesthetic minimalism" which reads as cold, clinical, lonely. The skill teaches how to direct warmth INTO minimal compositions, getting the clean look without the emotional void.

**The Neuroscience**: Warm colors trigger approach behaviors and lower cognitive vigilance — the viewer feels safe. Cool colors trigger alertness and avoidance. This is not aesthetic preference; it's how photoreceptors and neural pathways process visual information.

---

## What Claude Does vs What You Decide

> "Claude handles the prompt engineering. You bring the emotional truth."

| Claude handles | You provide |
|---------------|-------------|
| Translating emotional intent into Flux/MJ prompt syntax | The emotion each image must convey |
| Applying the 4-layer prompt architecture consistently | Brand palette and visual identity |
| Flagging prompt anti-patterns that produce sad/cold images | Validation — does this FEEL right? |
| Generating batch-consistent style prefixes | Subject matter and context for each image |
| Optimizing aspect ratios and technical parameters | Final selection between generated options |

**Remember**: AI can generate technically perfect minimalist images that feel completely wrong. Your gut reaction to the emotion is the quality gate, not the composition.

---

## What This Skill Does

1. **Emotional Calibration** - Defines the target emotion BEFORE writing any prompt
2. **4-Layer Prompt Architecture** - Style + Subject + Emotion + Anti-patterns in every prompt
3. **Batch Consistency** - Creates a shared style prefix for visual cohesion across sets
4. **Anti-Pattern Detection** - Flags words/directions that trigger cold/sad/clinical outputs
5. **Brand Alignment** - Maps brand voice to visual language (warm brand = warm photos)

## How to Use

### Generate images for website cards
```
I need 3 card images for a child development psychologist website.
Brand palette: cream, coral, warm earth tones.
Cards: Motor Development, Emotional Development, Cognitive Development.
Target emotion: hopeful, warm, possibility.
Generator: Replicate Flux 1.1 Pro, 3:4 aspect ratio.
```

### Create a cohesive blog image set
```
Generate prompts for 13 blog articles about parenting and child psychology.
All images must feel like they're from the same photo shoot.
Brand: warm, approachable, Latin American families.
Avoid: clinical, sad, isolated figures, stock photo poses.
```

### Fix images that came back too cold
```
These minimalist images came back sad/cold. Here's the original prompt: [prompt].
Keep the minimalist composition but make it emotionally warm.
The image should make a parent feel "I want to be that parent" not "that's beautiful but lonely."
```

## Instructions

When generating minimalist image prompts, follow this methodology precisely:

### Step 1: Define the Emotional Target
Before writing ANY prompt, answer:

```
## Emotional Brief

**This image should make the viewer feel:** ________________
**The viewer should want to:** ________________
**This is NOT about:** ________________

**Emotional quadrant:**
        WARM
         |
ACTIVE --+-- CALM
         |
        COLD

Target: [e.g., Warm + Calm = nurturing serenity]
```

**Key principle**: If you can't name the emotion in 2 words, the image will be vague.
**Emotional vocabulary for warm minimalism:**

| Warm + Active | Warm + Calm |
|--------------|-------------|
| Delight, play, discovery | Serenity, connection, trust |
| Courage, determination, pride | Presence, intimacy, safety |
| Freedom, possibility, wonder | Patience, tenderness, focus |

| Cold + Active (AVOID) | Cold + Calm (AVOID) |
|----------------------|---------------------|
| Anxiety, urgency, pressure | Loneliness, melancholy, void |
| Frustration, anger, defeat | Isolation, clinical, sterile |

**Color psychology for emotional targeting:**

| Color range | Emotional effect | Use when... |
|-------------|-----------------|-------------|
| Cream/ivory (#FAF8F5) | Soft, approachable, comfortable base | Every warm minimalist image (background) |
| Terracotta (#C2704F) | Earthy warmth, trustworthiness, permanence | Brands in family, wellness, coaching |
| Warm pink (#FFC0CB) | Nurturing, gentleness, calming | Child development, early childhood |
| Golden/yellow (2700K) | Happiness, energy, sunlight, cozy | Golden hour shots, living room scenes |
| Orange tones | Friendly, fights depression, inviting | Social/community-oriented images |
| Sage/olive (muted green) | Natural, grounded, trustworthy | Earthy brand palettes alongside terracotta |

---

### Step 2: Build the 4-Layer Prompt
Every prompt has exactly 4 layers:

```
## Prompt Architecture

[LAYER 1: STYLE] Technical photography direction
[LAYER 2: SUBJECT] Who/what is in the frame
[LAYER 3: EMOTION] Specific emotional cues
[LAYER 4: ANTI-PATTERNS] What to explicitly exclude
```

**Layer 1 — Style Prefix** (reuse across batch):
```
Warm minimalist photography. Soft natural light, shallow depth of field,
[BRAND PALETTE TONES]. Candid moment, not posed. [DEMOGRAPHIC].
Shot on 85mm f/1.8 lens, Kodak Portra 400 film look, natural skin texture.
No text, no logos, no watermarks. Warm color temperature.
```

**Film stock trick**: Adding "Kodak Portra 400" or "Kodak Portra 800" instantly introduces organic warmth, fine grain, and natural skin tones. This single phrase fights AI's default plastic/clinical rendering better than any other modifier.

**HEX color precision** (Flux 2+): Associate HEX codes with specific objects — `"The wall is #FAF8F5 cream"` works better than `"use #FAF8F5 in the image"`. Always pair HEX with a color name.

Key style levers:
| Lever | Warm direction | Cold direction (avoid) |
|-------|---------------|----------------------|
| Light | Soft natural, golden hour, window light | Studio flash, overhead fluorescent |
| Background | Cream, warm wood, sunlit room | White void, concrete, gray |
| Depth of field | Shallow (f/1.8) — intimacy | Deep (f/11) — documentary |
| Color temp | Warm (2700-3000K golden, 3200-4500K daylight) | Cool (6500K+) |
| Framing | Close, eye-level, inclusive | Wide, above, distant |
| Film stock | Kodak Portra 400, Fujifilm Pro 400H | No film reference (digital default) |
| Texture | "natural skin texture, pores, freckles" | "smooth skin, flawless" (= plastic) |

**Layer 2 — Subject:**
```
A [age] [demographic] child [action verb + specific detail].
[Body language cue]. [One environmental detail].
```

Rules:
- One action verb, one detail (not a paragraph)
- Body language > facial expression for Flux
- One environmental detail grounds the scene (wooden floor, sunlit garden)
- "Mid-action" > "posing" (hands placing a block > holding a block)
- **Always specify demographics** — Flux has training biases and will default if unspecified

**Body language science** — warm vs cold signals:
| Warm signals (USE) | Cold signals (AVOID) |
|-------------------|---------------------|
| Duchenne smile (eyes squeezing + mouth) | Fake smile (mouth only, no eye engagement) |
| Direct eye contact, maintained gaze | Eyes turned to side or downward |
| Open posture, arms uncrossed | Arms crossed over chest (barrier) |
| Relaxed, self-assured stance | Rigid posture, head tilted back |
| Physical proximity or gentle touch | Distance between subjects |
| Leaning in, at eye level | Leaning away, looking from above |

**Layer 3 — Emotion Injection:**
```
[Mood word]. [Light descriptor that reinforces mood].
```

Proven emotion-to-prompt mappings:
| Target emotion | Prompt language |
|---------------|-----------------|
| Joy/delight | "pure delight", "laughing", "arms wide" |
| Connection | "eye contact", "faces close", "at eye level" |
| Curiosity | "deeply focused", "hands mid-action", "slight smile" |
| Safety | "gentle touch", "both at ease", "calm conversation" |
| Pride | "standing tall", "determination", "just accomplished" |
| Possibility | "looking up/ahead", "about to", "the moment before" |

**Layer 4 — Anti-Pattern Blockers:**
Words that trigger cold/sad in AI generators:

| NEVER use | Use instead |
|-----------|-------------|
| `alone`, `solitary`, `quiet room` | `single subject, clean background` |
| `studio lighting`, `white background` | `soft natural light, warm background` |
| `looking at camera`, `posing` | `candid moment`, `mid-action` |
| `dark`, `moody`, `dramatic` | `warm`, `soft`, `gentle` |
| `black and white`, `monochrome` | `warm tones`, `earth tones` |
| `empty`, `vast`, `sparse` | `minimal`, `clean`, `uncluttered` |
| `pensive`, `thoughtful` (alone) | `focused`, `curious`, `engaged` |
| `sitting alone` | `sitting with [object/activity]` |
| `perfect`, `flawless`, `symmetry` | `natural`, `authentic`, `organic` |
| `smooth skin`, `airbrushed` | `natural skin texture`, `pores`, `subtle imperfections` |
| `3D render`, `CGI`, `hyperrealistic` | `photography`, `candid`, `film look` |

**Negative prompt suffix** (append to every prompt for Flux):
```
--no plastic skin, glossy surfaces, artificial lighting, airbrushed,
sterile, clinical, 3D render, CGI, harsh shadows, cool tones
```

---

### Step 3: Validate Before Generating
Before sending to the API, run this checklist:

```
## Pre-Generation Checklist

- [ ] Can I name the target emotion in 2 words?
- [ ] Does the subject have an ACTION (not just a state)?
- [ ] Is there at least one warmth signal (light, touch, smile, color)?
- [ ] Are there zero isolation signals (alone, empty, quiet)?
- [ ] Is the demographic consistent with the brand?
- [ ] Does the style prefix match the batch?
```

---

### Step 4: Evaluate Generated Images
Rate each generated image:

```
## Image Evaluation

**Emotional hit?** [Yes/No] — Does it trigger the target emotion within 2 seconds?
**Warmth level:** [1-5] — 1=clinical, 3=neutral, 5=cozy
**Brand fit:** [Yes/No] — Does it feel like it belongs on the brand's site?
**Minimalism quality:** [Clean/Busy] — Is the composition uncluttered?
**Stock photo test:** [Pass/Fail] — Would you mistake this for generic stock?

If emotional hit = No → rewrite Layer 3 (emotion) first
If warmth < 3 → add warm lighting/color cues to Layer 1
If stock photo test = Fail → make Layer 2 more specific (exact age, exact action)
```

---

### Step 5: Iterate on Failures
Common failure patterns and fixes:

| Problem | Root cause | Fix |
|---------|-----------|-----|
| Image is beautiful but sad | Isolation signals in prompt | Add connection (person+person or person+activity) |
| Image is warm but generic | Subject too vague | Add one hyper-specific detail ("wooden blocks" not "toys") |
| Image feels like stock | "Looking at camera" or "smiling" | Switch to candid mid-action |
| Inconsistent batch style | Style prefix varies | Copy-paste exact same Layer 1 |
| Wrong age/demographic | Generator defaults | Be explicit: "4-year-old", "Latin American" |

## Platform-Specific Guide: Flux 1.1 Pro

> Flux is the primary recommended generator for warm minimalist photography. These rules are Flux-specific.

### Syntax Rules
- **Write like you're talking to a photographer**, not typing keywords into a search engine
- Flux uses natural language — full sentences, NOT comma-separated keyword lists
- **30-80 words is the sweet spot** — under 200 tokens for optimal quality
- **NO prompt weights** — `(text:1.5)` is ignored. Use "with emphasis on X" instead
- **Specify demographics explicitly** — Flux has training biases and will default to Western/white/young if unspecified

### Recommended Structure
```
[Subject + specific details] performing [action] in [environment],
[lighting: direction + quality + time of day],
shot on [camera/lens], [film stock reference],
[composition note], [emotional tone],
natural skin texture, candid moment
--no [anti-patterns]
```

### Camera Filename Trick (Raw Mode)
For hyper-realistic results, prefix the prompt with a camera filename:
- `IMG_2847.HEIC` — iPhone snapshot realism
- `IMG_5847.CR2` — Canon DSLR raw aesthetic
- `DSC03291.ARW` — Sony camera look

**Example**: `IMG_2847.HEIC A mother and child laughing together at a café table, soft window light, slightly grainy, Kodak Portra 400 warmth, authentic moment`

### Raw Mode
Flux Raw Mode adds natural imperfections: skin texture, realistic lighting, natural asymmetry. Best for portraits and lifestyle. Use minimal prompts — let the realism engine do its work.

### Aspect Ratios
- **3:4** — Portrait cards, service pages (recommended for website cards)
- **4:5** — Instagram, vertical lifestyle
- **16:9** — Blog headers, hero images
- **1:1** — Social media, profile images

---

## Examples

### Example 1: Child Development Website Cards

**Context**: 3 service area cards for a child psychologist's website. Brand is warm, approachable, cream/coral palette. Target: parents who want to understand their child's development.

**Input**:
> Generate 3 card images for Desarrollo Motor, Emocional, Cognitivo. Warm minimalist, Flux 1.1 Pro, 3:4 ratio.

**Output**:

**Style prefix (shared):**
```
Warm minimalist photography. Soft natural light, shallow depth of field,
warm cream and beige tones. Candid moment, not posed. Latin American family.
Shot on 85mm f/1.8 lens. No text, no logos, no watermarks.
Warm color temperature, hopeful joyful mood.
```

**Card 1 — Desarrollo Motor** (Emotion: joyful possibility)
```
[STYLE PREFIX] A 4-year-old child mid-jump on warm wooden floor, arms wide
open, barefoot. Pure delight and concentration on face. Soft motion blur on
hands. Single subject, clean warm background. The moment right before
landing — suspended possibility.
```

**Card 2 — Desarrollo Emocional** (Emotion: intimate connection)
```
[STYLE PREFIX] A mother crouching at eye level with her 5-year-old daughter,
faces close, gentle smiles, eye contact. Golden hour light. Intimate
connection between adult and child. Minimal warm background, soft cream tones.
```

**Card 3 — Desarrollo Cognitivo** (Emotion: serene curiosity)
```
[STYLE PREFIX] A 6-year-old child sitting cross-legged on the floor, deeply
focused building a tall wooden block tower. Hands mid-action placing a block.
Calm concentration on face, slight smile. Soft overhead natural light,
earth tones.
```

**Why this works**: Each image has one clear emotion, one specific action, warm lighting, and no isolation signals. The shared style prefix ensures visual cohesion across the set.

---

### Example 2: Fixing a "Beautiful but Sad" Image

**Context**: A minimalist illustration of a woman crouching alone was generated for a "limits without yelling" blog post. The art direction was "minimalist" but the result felt melancholy.

**Input**:
> The line art minimalist image came back too sad. It's a woman crouching alone in black and white. Fix it.

**Analysis of failure:**
- `alone` → isolation signal
- `black and white` → removes warmth
- `crouching` with no context → reads as defeated
- No other person or activity → loneliness

**Fixed prompt:**
```
Warm minimalist photography. Soft natural light, shallow depth of field,
warm cream and beige tones. Candid moment, not posed.
Shot on 85mm f/1.8 lens. No text, no logos, no watermarks.
Warm color temperature.

A mother and 4-year-old child sitting face to face on a couch, mother
holding both of child's hands gently, calm conversation. Both at ease.
Warm living room light filtering through curtains.
```

**What changed:**
- Solo → pair (connection defeats loneliness)
- B&W → warm tones (color = life)
- Crouching → sitting face to face (equals, not defeated)
- Added environmental warmth (couch, living room light)

---

## Skill Boundaries (Frontier Recognition)

### This skill excels for:
- Generating cohesive sets of 3-20+ images with consistent style
- Warm/approachable brands (family, wellness, education, coaching)
- Photorealistic AI generators (Flux, Midjourney v6+, DALL-E 3)

### This skill is NOT ideal for:
- Brands that WANT cold/clinical aesthetics (tech, luxury, medical) → Adjust Layer 1 accordingly
- Abstract/conceptual images (infographics, diagrams) → Use `data-visualizer` skill instead
- Product photography → Requires different prompt architecture
- Illustration styles (watercolor, vector, line art) → Adapt Layer 1 for illustration-specific generators

### Quality Checkpoints

Before accepting the output, verify:
- [ ] 2-second gut check: does the image make you feel the target emotion?
- [ ] Warmth score >= 4 out of 5
- [ ] No accidental isolation signals in the composition
- [ ] Consistent with the rest of the batch (same light, same tones)
- [ ] Would NOT be mistaken for generic stock photography

---

## Iteration Guide

> "The first output is a starting point, not a destination."

### Recommended Iteration Pattern

| Pass | Focus | Questions to Ask |
|------|-------|------------------|
| **1st** | Emotion | "Does this FEEL right within 2 seconds?" |
| **2nd** | Specificity | "Is this too generic? What one detail would make it unique?" |
| **3rd** | Consistency | "Does this match the rest of the set?" |
| **4th** | Brand | "Would the client recognize this as THEIR brand?" |

### Useful Follow-up Prompts

- "The image is warm but feels generic. Add one hyper-specific detail to the subject."
- "The emotion is too [intense/subtle]. Dial it [down/up] by adjusting the body language."
- "The background is too busy. Simplify to [one element] and increase the bokeh."
- "This looks like stock. Make the child's action more specific — what exactly are their hands doing?"

---

## Checklists & Templates

### Batch Brief Template

```
## Image Batch Brief

**Brand:** ________________
**Palette:** ________________
**Demographic:** ________________
**Generator:** Flux 1.1 Pro / Midjourney v6 / DALL-E 3
**Aspect ratio:** ________________
**Number of images:** ________________

### Style Prefix (copy-paste for ALL prompts)
[Write once, use everywhere]

### Per-Image Briefs
| # | Subject | Target emotion (2 words) | Specific action |
|---|---------|--------------------------|-----------------|
| 1 | | | |
| 2 | | | |
| 3 | | | |
```

### Red Flags Checklist

```
## Warning Signs in Your Prompts

- [ ] Any word from the "NEVER use" list (alone, empty, dark, moody, studio)
- [ ] Subject has no action verb (just standing/sitting with no activity)
- [ ] No warmth signal (no mention of light quality, color temperature, or human connection)
- [ ] Demographic not specified (generator will default to its biases)
- [ ] More than 3 adjectives in a row (over-direction = generic output)
- [ ] Prompt longer than 80 words (Flux sweet spot is 30-80 words, degrades past 200 tokens)
```

## References

### Core Methodology
- Norman, Don. "Emotional Design" (2004) - Three levels of design processing (visceral, behavioral, reflective)
- Annie Leibovitz. Masterclass on Portrait Photography - Light as emotion
- Kittl x Savee. "2026 Design Trends Report" - Warm minimalism as dominant trend

### Flux & AI Image Generation
- [Black Forest Labs Prompting Guide](https://docs.bfl.ai/guides/prompting_summary) - Official Flux prompt best practices
- [Flux 2 Prompting Guide (fal.ai)](https://fal.ai/learn/devs/flux-2-prompt-guide) - JSON/HEX color structured prompts
- [Flux Raw Mode Guide (Segmind)](https://blog.segmind.com/flux-1-1-pro-raw-mode-for-creating-natural-realistic-images/) - Natural imperfections
- [Official BFL Skills Repo](https://github.com/black-forest-labs/skills) - Prompting patterns per AgentSkills spec
- [Kodak Portra 400 Midjourney Style (Midlibrary)](https://midlibrary.io/styles/kodak-portra-400) - Film stock reference

### Color Psychology & Neuroscience
- [Color Psychology in Photography (Skylum)](https://skylum.com/blog/color-psychology-for-photographers) - Warm/cold tones and emotional response
- [Visual Environment & Thermal Perception (ScienceDirect)](https://www.sciencedirect.com/science/article/pii/S0306456523000293) - 80% of experiments show visual → thermal link
- [Cold Temperatures in Photos Increase Cognitive Control (ScienceDaily)](https://www.sciencedaily.com/releases/2017/04/170410085010.htm) - Warm → relaxed, cool → alert

### Photography Technique
- [Photographer's Essential Guide to Body Language (SLR Lounge)](https://www.slrlounge.com/photographers-essential-guide-body-language/) - Warm/cold posture cues
- [Photography Composition Definitive Guide (Anton Gorlin)](https://antongorlin.com/blog/photography-composition-definitive-guide/) - Frame-within-frame for intimacy
- [Fixing Plastic AI Skin (Rezience)](https://andyhtu.com/fixing-plastic-ai-skin/) - Negative prompts for realistic texture
- [120+ Stable Diffusion Negative Prompts (ClickUp)](https://clickup.com/blog/stable-diffusion-negative-prompts/) - Anti-pattern word lists

### Warm Minimalism Trend
- [Warm Minimalism Trend 2026 (Good Housekeeping)](https://www.goodhousekeeping.com/home/decorating-ideas/a69926948/new-warm-minimalism-trend/) - "Less but better"
- [Earthy Color Palette Ideas (Rose Benedict Design)](https://rosebenedictdesign.com/2025/01/31/earthy-color-palettes/) - Brand application of earth tones

### Art Direction Methodology
- [How to Write a Photoshoot Brief (Milanote)](https://milanote.com/guide/photoshoot-brief) - Emotional objectives in briefs
- [Creative Briefs for Photographers (VSCO)](https://www.vsco.co/learn/creative-photography-briefs) - SMART emotional criteria

## Related Skills

- [design-trends-2026](../design-trends-2026/) - Current visual trends to align with
- [brand-strategy](../../branding/brand-strategy/) - Brand foundation before visual direction
- [image-batch](../../automation/image-batch/) - Post-processing (resize, compress, WebP)

---

## Skill Metadata

```yaml
name: minimalist-image-director
category: ai-design
subcategory: art-direction
version: 2.0
author: GUIA
source_expert: Editorial Photography + Don Norman (Emotional Design) + Color Psychology + Neuroscience of Visual Perception + Black Forest Labs (Flux)
source_work: null
difficulty: intermediate
mode: centaur
estimated_value: Art director day rate (~500-800 EUR/day)
tags: [image-generation, art-direction, minimalism, flux, replicate, midjourney, brand-photography, emotional-design, color-psychology, warm-minimalism, kodak-portra]
created: 2026-02-12
updated: 2026-02-12
```

---



---
name: image-upscaling
description: "Upscale and enhance images with Real-ESRGAN, Thera, Topaz, FLUX Upscaler via inference.sh CLI. Models: Real-ESRGAN, Thera (any size), FLUX Dev Upscaler, Topaz Image Upscaler. Use for: enhance low-res images, upscale AI art, restore old photos, increase resolution. Triggers: upscale image, image upscaler, enhance image, increase resolution, real esrgan, ai upscale, super resolution, image enhancement, upscaling, enlarge image, higher resolution, 4k upscale, hd upscale"
allowed-tools: Bash(belt *)
---

> **Install the belt CLI skill:** `npx skills add belt-sh/cli`

# Image Upscaling

Upscale and enhance images via [inference.sh](https://inference.sh) CLI.

![Image Upscaling](https://cloud.inference.sh/u/33sqbmzt3mrg2xxphnhw5g5ear/01k8d77p126y82zfecnt46hy4h.png)

## Quick Start

> Requires inference.sh CLI (`belt`). [Install instructions](https://raw.githubusercontent.com/inference-sh/skills/refs/heads/main/cli-install.md)

```bash
belt login

belt app run infsh/real-esrgan --input '{"image_url": "https://your-image.jpg"}'
```


## Available Upscalers

| Model | App ID | Best For |
|-------|--------|----------|
| Topaz Image Upscaler | `falai/topaz-image-upscaler` | Professional quality, any image |

## Examples

### Upscale Any Image

```bash
belt app run falai/topaz-image-upscaler --input '{"image_url": "https://low-res-image.jpg"}'
```

### Workflow: Generate and Upscale

```bash
# 1. Generate image with FLUX Klein (fast)
belt app run falai/flux-2-klein-lora --input '{"prompt": "landscape painting"}' > image.json

# 2. Upscale the result
belt app run falai/topaz-image-upscaler --input '{"image_url": "<url-from-step-1>"}'
```

## Use Cases

- **AI Art**: Upscale generated images for print
- **Old Photos**: Restore and enhance resolution
- **Web Images**: Prepare for high-DPI displays
- **Print**: Increase resolution for large prints
- **Thumbnails**: Create high-res versions

## Related Skills

```bash
# Full platform skill (all 250+ apps)
npx skills add inference-sh/skills@infsh-cli

# Image generation (generate then upscale)
npx skills add inference-sh/skills@ai-image-generation

# FLUX models
npx skills add inference-sh/skills@flux-image

# Background removal
npx skills add inference-sh/skills@background-removal
```

Browse all image apps: `belt app store --category image`

## Documentation

- [Running Apps](https://inference.sh/docs/apps/running) - How to run apps via CLI
- [Image Generation Example](https://inference.sh/docs/examples/image-generation) - Complete image workflow guide
- [Apps Overview](https://inference.sh/docs/apps/overview) - Understanding the app ecosystem








---
name: icon-set-generator
description: "Generate cohesive, project-specific SVG icon sets for websites and applications. Use this skill whenever the user needs custom icons, an icon set for a website or app, icons for a client project, or mentions needing SVG icons that look consistent together. Also trigger when the user describes a project and icons would naturally be part of the deliverable — e.g. 'I'm building a site for a plumber' implies they'll need service icons. Trigger on: 'icons for', 'icon set', 'custom icons', 'SVG icons', 'make me icons', 'I need icons', 'website icons', 'project icons', or any request for consistent visual assets for a web project. Produces individual SVG files with a consistent style engine, not generic icon library lookups."
compatibility: claude-code-only
---

# Icon Set Generator

Generate custom, visually consistent SVG icon sets tailored to specific projects. Each set is built from a shared style specification so every icon looks like it belongs with the others — same stroke weight, same corner treatment, same visual density.

## Why This Matters

Generic icon libraries (Lucide, Heroicons) are great but every site using them looks similar. A custom icon set gives a project distinct visual identity. The hard part is consistency — drawing 20+ icons individually causes style drift. This skill solves that by defining style rules once and enforcing them across every icon.

## Workflow
### Step 1: Understand the Project

Ask about the project. You need enough to suggest icons and pick a style:

- What's the business/project? (industry, name, vibe)
- Any brand guidelines or colour palette? (informs style choices even though SVGs use currentColor)
- What feel? (modern, friendly, corporate, minimal, bold)
- Roughly how many icons? (typical small site: 15-25)

A brief like "plumber in Newcastle, modern feel" is enough to proceed. Don't over-interview.

### Step 2: Suggest Icons

Read `references/industry-icons.md` for industry-specific suggestions. Organise into groups:

- **Navigation** — menu, close, arrows, search
- **Communication** — phone, email, location, clock
- **Trust** — star, shield, award, users
- **Actions** — download, share, calendar, form
- **Industry-Specific** — icons unique to this business type

Present the list. Let the user add, remove, or rename before generating.

### Step 3: Define the Style Spec

Read `references/style-presets.md` for full preset definitions. Pick one as starting point:

| Preset | Best For | Stroke | Caps/Joins | Corners |
|--------|----------|--------|------------|---------|
| Clean | Most business sites | 1.5px | round/round | 2px |
| Sharp | Corporate/technical | 1.5px | square/miter | 0px |
| Soft | Friendly/approachable | 2px | round/round | 4px |
| Minimal | Elegant/editorial | 1px | round/round | 0px |
| Bold | High impact/accessible | 2.5px | round/round | 2px |

Tell the user which preset you're recommending and why, then confirm.

### Step 4: Generate the Icons
Generate every icon following the SVG Rules below. Output to an `icons/` directory in the project root (or the user's preferred location).

Read `references/svg-examples.md` before generating — it contains reference implementations showing the right level of complexity and how to handle common icon shapes.
Generate in batches of ~5. After each batch, visually review for consistency before continuing. After all icons are done, create the preview page and style-spec.json.

### Step 5: Deliver

Output structure:
```
icons/
├── style-spec.json
├── preview.html
├── home.svg
├── phone.svg
└── ...
```

Present `preview.html` first so the user sees the complete set visually.

---

## SVG Rules

Every icon in a set MUST follow all of these. Even small inconsistencies — a slightly different stroke width, a rounded corner where others are sharp — make the set look amateur.

### SVG Template

Every icon uses this exact outer structure:

```xml
<svg xmlns="http://www.w3.org/2000/svg"
  width="{grid}" height="{grid}"
  viewBox="0 0 {grid} {grid}"
  fill="none"
  stroke="currentColor"
  stroke-width="{strokeWidth}"
  stroke-linecap="{strokeLinecap}"
  stroke-linejoin="{strokeLinejoin}">
  <!-- icon paths here -->
</svg>
```

### Hard Rules

1. **`currentColor` only** — Never hardcode colours. SVGs inherit colour from CSS. No `fill="#000"` or `stroke="blue"`. If a shape needs fill, use `fill="currentColor"`.
2. **Identical viewBox** — Every icon uses the same `viewBox`. No exceptions.
3. **Identical root stroke attributes** — `stroke-width`, `stroke-linecap`, `stroke-linejoin` on the `<svg>` element must match across all icons. Override on individual elements only when truly necessary.
4. **No transforms on root** — No `translate`, `rotate`, `scale`. Bake positioning into coordinates.
5. **No IDs or classes** — Keep SVGs clean for external styling.
6. **Coordinate precision** — Max 2 decimal places. Snap to half-pixel grid (e.g. `12`, `12.5`, not `12.333`).
7. **Consistent padding** — Maintain configured padding from viewBox edge. For 24px grid with 2px padding, draw within 2–22 coordinate range.
8. **Minimal elements** — Fewest `<path>`, `<circle>`, `<rect>`, `<line>` elements practical. Simpler = smaller + faster rendering.
9. **Visual centring** — Appear visually centred, not just mathematically centred. A leftward arrow shifts slightly right. A house with a chimney adjusts for asymmetry.

### Optical Corrections

Subtle but essential for professional results:

- **Curved stroke compensation**: Curves appear thinner than straight lines at same stroke width. For primarily curved icons (phone, globe), make paths slightly larger rather than changing stroke width.
- **Pointed shape overshoot**: Arrows, chevrons, triangles extend ~0.5px beyond where a square would stop to appear the same size.
- **Visual weight balancing**: Simple icons (single chevron) look lighter than complex ones (gear). Make simpler icons slightly larger in the grid, or use slightly more substantial paths. No icon should look noticeably lighter or heavier than the others.

---

## style-spec.json

```json
{
  "name": "project-name-icons",
  "preset": "clean",
  "grid": 24,
  "strokeWidth": 1.5,
  "strokeLinecap": "round",
  "strokeLinejoin": "round",
  "cornerRadius": 2,
  "padding": 2,
  "opticalBalance": true,
  "iconCount": 20,
  "icons": ["home", "phone", "email"],
  "generated": "2026-02-15"
}
```

---

## Preview Page
Generate a self-contained HTML file displaying all icons for visual review. Read `references/preview-template.md` for the template. Requirements:

- Grid of all icons at native size (24px) with labels
- Same grid at 2x (48px) for detail inspection
- Dark background section (white on dark) for contrast check
- Style spec summary at top
- Inline CSS, no dependencies — just open in browser
- Inline all SVGs directly into the HTML (don't reference external files)

---

## Quality Checklist
Verify every item before delivering:

- [ ] All SVGs have identical `viewBox`, `stroke-width`, `stroke-linecap`, `stroke-linejoin`
- [ ] All SVGs use `currentColor` exclusively
- [ ] Visual weight is balanced across the set
- [ ] Padding is consistent (nothing touching viewBox edge)
- [ ] All icons visually centred
- [ ] Filenames are lowercase kebab-case (`arrow-right.svg`)
- [ ] Preview HTML renders all icons correctly
- [ ] style-spec.json is accurate and lists all icons

---

## Reference Files
Read these before generating:

- `references/style-presets.md` — Detailed preset definitions and selection guidance
- `references/industry-icons.md` — Industry-specific icon suggestions
- `references/preview-template.md` — HTML template for the preview page
- `references/svg-examples.md` — Example SVGs showing proper construction at various complexity levels





# Industry Icon Suggestions

When a user describes their project, use this reference to suggest appropriate icons. These are starting points — always adapt to the specific project and ask the user to confirm.

## Universal Icons (Include for Almost Every Website)

These icons appear on nearly every business website regardless of industry:

- **menu** — hamburger/three lines for mobile nav
- **close** / **x** — close modals, menus, notifications
- **chevron-down** — dropdowns, accordions, "read more"
- **arrow-right** — CTAs, links, "learn more"
- **phone** — contact section, header
- **email** / **mail** — contact section, newsletter
- **location-pin** / **map-pin** — address, service area
- **clock** — business hours, response times
- **search** — site search (if applicable)
- **external-link** — links opening in new tab (optional)

## Industry-Specific Suggestions

### Trades & Home Services
Plumber, electrician, HVAC, builder, landscaper, painter, locksmith, pest control.
**Services**: wrench, hammer, droplet (water), flame (gas/heating), bolt (electrical), pipe, thermometer, fan (HVAC), paintbrush, leaf (landscaping), shield-check (licensed/insured), hard-hat, tape-measure
**Trust**: license-badge, insurance-shield, years-experience, thumbs-up, guarantee
**Urgency**: alert-circle (emergency), clock-fast (24/7), phone-call (call now)
**Typical set size**: 18-25 icons

### Professional Services
Accountant, lawyer, financial advisor, consultant, architect.
**Services**: briefcase, document, scale (legal), calculator, chart-bar, chart-line, clipboard, pen, handshake, building, gavel (legal), percent (financial)
**Trust**: award, certificate, shield-check, users (team), graduation-cap
**Process**: steps/workflow, calendar, checklist, folder
**Typical set size**: 15-22 icons

### Health & Medical
Physio, dentist, GP, chiropractor, optometrist, veterinary, pharmacy.
**Services**: heart, stethoscope, tooth (dental), eye (optometry), bone (chiro/physio), paw (vet), pill (pharmacy), bandage, clipboard-medical, first-aid
**Booking**: calendar-check, clock, phone
**Accessibility**: wheelchair, ear (hearing), brain
**Tyical set size**: 18-24 icons

### Hospitality & Food
Restaurant, café, bar, catering, bakery, food truck.
**Food/Drink**: utensils, wine-glass, coffee, chef-hat, cake (bakery), pizza, plate
**Services**: reservation/calendar, wifi, parking, truck (delivery), bag (takeaway), receipt
**Ambience**: music-note, candle, sun/moon (daytime/evening)
**Typical set size**: 15-22 icons

### Retail & E-Commerce
Online store, boutique, general retail.
**Shopping**: cart, bag, tag/label, credit-card, receipt, barcode, gift
**Delivery**: truck, package, return-arrow, tracking
**Product**: ruler/size-guide, colour-swatch, zoom-in, heart (wishlist), compare
**Account**: user, lock, bell (notifications)
**Typical set size**: 20-30 icons

### Real Estate
Agent, property management, development.
**Property**: home, building, key, door, window, fence, pool
**Features**: bed, bath, car (garage), ruler (sqm), tree (outdoor), sun (aspect)
**Process**: search, map, camera (photos), video (virtual tour), document, pen (sign)
**Typical set size**: 20-28 icons

### Education & Training
School, tutoring, online courses, coaching.
**Learning**: book, graduation-cap, pencil, lightbulb, brain, puzzle, target
**Dlivery**: video, screen/monitor, headphones, microphone, download
**Progress**: chart-up, trophy, badge, checklist, certificate
**Typical set size**: 18-24 icons

### Technology & SaaS
Software company, IT services, tech startup.
**Product**: code, terminal, cloud, server, database, api-bracket, smartphone, laptop
**Security**: lock, shield, key, fingerprint, eye-off
**Collaboration**: users, chat, share, git-branch, plug (integration)
**Typical set size**: 20-30 icons

### Creative & Design
Design studio, photographer, videographer, marketing agency.
**Creative**: camera, video, palette, pen-tool, layers, crop, image
**Delivery**: download, share, cloud-upload, folder, eye (preview)
**Process**: lightbulb, target, chart-up, megaphone (marketing)
**Typical set size**: 15-22 icons

### Non-Profit & Community
Charity, community org, church, sports club.
**Mission**: heart, hands (helping), globe, leaf (environment), people-group
**Engagement**: calendar (events), megaphone, chat, share, donate/gift
**Resources**: book, document, link, download

**Typical set size**: 15-20 icons
### Automotive
Mechanic, car dealer, detailing, towing.
**Vehicle**: car, truck, engine, wrench, oil-drop, tire, gauge, battery
**Service**: clipboard, calendar, phone, clock, shield-check (warranty)
**Typical set size**: 18-24 icons

---

## Suggesting Icons — Guidelines

1. **Start with universals** — Every site needs nav and contact icons
2. **Add industry specifics** — Pick the most relevant 6-10 from the industry list
3. **Consider the site structure** — What pages will they have? Each page might need its own icon for navigation or feature sections
4. **Don't over-suggest** — 15-25 is the sweet spot. More than 30 icons and the user is overwhelmed, less than 12 and the set feels incomplete
5. **Use clear names** — Name icons by what they depict, not their function. "wrench" not "services". "phone" not "contact-us". This makes them reusable across contexts
6. **Group logically** — Present grouped by category so the user can evaluate coverage area by area




# Preview Page Template
Use this template to generate the preview.html file. Replace the placeholder content with actual icons and metadata.

## Template

```html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{{PROJECT_NAME}} — Icon Set Preview</title>
<style>
  * { margin: 0; padding: 0; box-sizing: border-box; }
  body {
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', system-ui, sans-serif;
    padding: 2rem;
    max-width: 1200px;
    margin: 0 auto;
    color: #1a1a1a;
    background: #fafafa;
  }
  h1 { font-size: 1.5rem; font-weight: 600; margin-bottom: 0.25rem; }
  .subtitle { color: #666; font-size: 0.9rem; margin-bottom: 2rem; }
  .spec {
    background: #fff;
    border: 1px solid #e5e5e5;
    border-radius: 8px;
    padding: 1rem 1.25rem;
    margin-bottom: 2rem;
    font-size: 0.85rem;
    color: #444;
    display: flex;
    flex-wrap: wrap;
    gap: 0.5rem 1.5rem;
  }
  .spec span { white-space: nowrap; }
  .spec strong { color: #1a1a1a; }
  h2 {
    font-size: 1.1rem;
    font-weight: 600;
    margin: 2rem 0 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 1px solid #e5e5e5;
  }
  .grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
    gap: 1rem;
  }
  .icon-card {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
    padding: 1rem 0.5rem;
    border-radius: 8px;
    background: #fff;
    border: 1px solid #e5e5e5;
    transition: border-color 0.15s;
  }
  .icon-card:hover { border-color: #999; }
  .icon-card svg { flex-shrink: 0; }
  .icon-card .label {
    font-size: 0.7rem;
    color: #666;
    text-align: center;
    word-break: break-all;
  }
  .dark-section {
    background: #1a1a1a;
    border-radius: 12px;
    padding: 2rem;
    margin-top: 2rem;
  }
  .dark-section h2 {
    color: #fff;
    border-bottom-color: #333;
  }
  .dark-section .icon-card {
    background: #2a2a2a;
    border-color: #333;
    color: #fff;
  }
  .dark-section .icon-card:hover { border-color: #555; }
  .dark-section .icon-card .label { color: #999; }
  .size-label {
    font-size: 0.75rem;
    color: #999;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }
</style>
</head>
<body>

<h1>{{PROJECT_NAME}} Icons</h1>
<p class="subtitle">{{ICON_COUNT}} icons · {{PRESET}} style · Generated {{DATE}}</p>

<div class="spec">
  <span><strong>Grid:</strong> {{GRID}}px</span>
  <span><strong>Stroke:</strong> {{STROKE_WIDTH}}px</span>
  <span><strong>Caps:</strong> {{STROKE_LINECAP}}</span>
  <span><strong>Joins:</strong> {{STROKE_LINEJOIN}}</span>
  <span><strong>Corner radius:</strong> {{CORNER_RADIUS}}px</span>
  <span><strong>Padding:</strong> {{PADDING}}px</span>
</div>

<h2>Native Size <span class="size-label">({{GRID}}px)</span></h2>
<div class="grid">
  <!-- REPEAT FOR EACH ICON -->
  <div class="icon-card">
    {{SVG_AT_NATIVE_SIZE}}
    <span class="label">{{ICON_NAME}}</span>
  </div>
  <!-- END REPEAT -->
</div>

<h2>2× Size <span class="size-label">({{GRID_2X}}px)</span></h2>
<div class="grid" style="grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));">
  <!-- REPEAT FOR EACH ICON -->
  <div class="icon-card">
    {{SVG_AT_2X_SIZE}}
    <span class="label">{{ICON_NAME}}</span>
  </div>
  <!-- END REPEAT -->
</div>

<div class="dark-section">
  <h2>Dark Background <span class="size-label">({{GRID_2X}}px)</span></h2>
  <div class="grid" style="grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));">
    <!-- REPEAT FOR EACH ICON -->
    <div class="icon-card">
      {{SVG_AT_2X_SIZE}}
      <span class="label">{{ICON_NAME}}</span>
    </div>
    <!-- END REPEAT -->
  </div>
</div>

</body>
</html>
```

## Implementation Notes
- For "native size" SVGs: render at the grid size (e.g. `width="24" height="24"`)
- For "2x size" SVGs: double the width/height attributes (e.g. `width="48" height="48"`) but keep the same viewBox
- The dark section uses CSS `color: #fff` on the card, which `currentColor` in the SVGs will inherit — no SVG changes needed
- Inline every SVG directly in the HTML. Don't use `<img>` tags or external references
- Replace all `{{PLACEHOLDER}}` values with actual data from the style spec



---
name: Style Presets Reference
description: Each preset defines a complete set of SVG attributes that ensure visual consistency across an icon set. Pick a preset as a starting point, then adjust individual parameters if the project calls for it.
---


# Style Presets Reference
Each preset defines a complete set of SVG attributes that ensure visual consistency across an icon set. Pick a preset as a starting point, then adjust individual parameters if the project calls for it.

## Preset: Clean
The safe default. Works for most business websites, SaaS dashboards, and professional services.

```json
{
  "grid": 24,
  "strokeWidth": 1.5,
  "strokeLinecap": "round",
  "strokeLinejoin": "round",
  "cornerRadius": 2,
  "padding": 2,
  "opticalBalance": true
}
```

**Character**: Balanced, professional, approachable without being casual. The round caps and joins soften the icons without making them feel childish. The 1.5px stroke is the sweet spot — visible without being heavy.
**Use when**: You don't have strong reasons to choose something else. This is the "can't go wrong" option.
**Drawing range**: With 24px grid and 2px padding, draw within coordinates 2–22.

---

## Preset: Sharp
Corporate, technical, precise. Good for law firms, engineering companies, fintech.

```json
{
  "grid": 24,
  "strokeWidth": 1.5,
  "strokeLinecap": "square",
  "strokeLinejoin": "miter",
  "cornerRadius": 0,
  "padding": 2,
  "opticalBalance": true
}
```

**Character**: Authoritative and precise. Square caps create definitive endpoints. Miter joins make clean 90° corners. Zero corner radius means rectangles are sharp.
**Use when**: The brand identity is formal, technical, or conveys precision and authority.
**Watch out for**: Miter joins can create spiky artifacts at acute angles. If a path has angles less than ~30°, consider using `stroke-linejoin="round"` on that specific element only.

---

## Preset: Soft
Friendly, warm, approachable. Good for childcare, health & wellness, food, community orgs.

```json
{
  "grid": 24,
  "strokeWidth": 2,
  "strokeLinecap": "round",
  "strokeLinejoin": "round",
  "cornerRadius": 4,
  "padding": 2.5,
  "opticalBalance": true
}
```

**Character**: Warm and inviting. The thicker 2px stroke gives more visual presence. Large corner radius makes everything feel rounded and friendly. Extra padding (2.5px) gives breathing room.
**Use when**: The project needs to feel approachable, non-intimidating, or playful.
**Drawing range**: With 2.5px padding, draw within coordinates 2.5–21.5.

---

## Preset: Minimal
Elegant, restrained, editorial. Good for luxury brands, design studios, photography portfolios.

```json
{
  "grid": 24,
  "strokeWidth": 1,
  "strokeLinecap": "round",
  "strokeLinejoin": "round",
  "cornerRadius": 0,
  "padding": 2,
  "opticalBalance": true
}
```

**Character**: Delicate and refined. The 1px stroke is thin — it looks elegant at larger sizes (32px+) but needs careful testing at smaller sizes. Zero corner radius keeps geometry pure.
**Use when**: The design is high-end, editorial, or minimalist. Works best when icons will be displayed at 28px+ size.
**Watch out for**: At 16-20px rendering, 1px strokes can look faint on standard-DPI screens. Recommend this preset only when you know the icons will be used at adequate sizes, or when the site targets retina displays.

---

## Preset: Bold
High impact, accessible. Good for outdoor brands, construction, emergency services, signage.

```json
{
  "grid": 24,
  "strokeWidth": 2.5,
  "strokeLinecap": "round",
  "strokeLinejoin": "round",
  "cornerRadius": 2,
  "padding": 2.5,
  "opticalBalance": true
}
```

**Character**: Strong and unmistakable. The 2.5px stroke is thick enough to read at small sizes and low contrast. Ideal for accessibility-focused projects or brands that want to feel strong and reliable.

**Use when**: Icons need to be legible in challenging conditions — small sizes, low contrast, outdoor signage, or accessibility requirements.

**Drawing range**: With 2.5px padding and thick strokes, the usable drawing area is tighter. Keep paths within 3–21 to avoid strokes bleeding into the padding.

---

## Customising Presets
You can mix parameters. Common adjustments:

- **Clean preset but with square caps**: More structured feel while keeping round joins
- **Soft preset but with 1.5px stroke**: Friendly corners but less heavy
- **Minimal preset but with 1.25px stroke**: Slightly more visible while staying refined
- **Bold preset but with miter joins**: Industrial/construction feel

Always document the customisation in the style-spec.json so the user knows exactly what was used.

---

## Grid Size Notes
24px is the standard and works for almost everything. Consider alternatives only if:

- **20px**: The design system is built on a 20px base unit (uncommon)
- **32px**: Icons will primarily display at large sizes (hero sections, feature lists)
- **16px**: Icons are exclusively for very small UI elements (rare — usually just use 24px and scale down)

Stick with 24px unless there's a specific reason not to.






---
name: SVG Examples Reference
description: These examples show how to construct icons correctly using the Clean preset (24px grid, 1.5px stroke, round caps/joins, 2px padding). Study the patterns before generating your set.
---


# SVG Examples Reference
These examples show how to construct icons correctly using the Clean preset (24px grid, 1.5px stroke, round caps/joins, 2px padding). Study the patterns before generating your set.

## Key Principles Demonstrated
1. All coordinates stay within the padding zone (2–22 for 24px grid with 2px padding)
2. Coordinates use at most 2 decimal places, preferring whole and half numbers
3. Paths are minimal — no unnecessary points or elements
4. Icons are visually centred, not just mathematically centred

---

## Simple Icon: Chevron Right
A basic directional indicator. Note the optical overshoot — the chevron extends slightly beyond what pure math would suggest, so it feels the same visual weight as boxier icons.

```xml
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
  <polyline points="9 6 15 12 9 18"/>
</svg>
```

**Why it works**: Single element. Points are clean whole numbers. The chevron occupies 6px horizontally (9→15) and 12px vertically (6→18) — slightly taller than wide, which is correct for a chevron that needs to feel balanced.

---

## Simple Icon: Close / X
Two diagonal lines crossing. Symmetrical and centred.

```xml
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
  <line x1="6" y1="6" x2="18" y2="18"/>
  <line x1="18" y1="6" x2="6" y2="18"/>
</svg>
```

**Why it works**: Perfectly symmetrical. Uses `<line>` elements because that's the simplest representation. Coordinates are all whole numbers. The X spans 12px in each direction (6→18), leaving 6px of padding on each side — generous, which gives the icon breathing room.

---

## Medium Icon: Home
A house shape combining a roof (triangle) and body (rectangle). Demonstrates combining multiple elements.

```xml
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
  <path d="M3 10.5L12 3l9 7.5"/>
  <path d="M5 9.5v10a1 1 0 001 1h12a1 1 0 001-1v-10"/>
  <path d="M9.5 20.5v-6h5v6"/>
</svg>
```

**Why it works**: Three paths — roof line, house body, door. The roof peak (12, 3) is at the top padding boundary. The house bottom (20.5) leaves room for the baseline. The door is centred horizontally. Corner radius on the house body (`a1 1 0 001 1`) matches the preset's cornerRadius of 2px (approximated as 1 in the arc for this scale).

---

## Medium Icon: Email / Mail
An envelope shape. Shows how to handle a recognisable real-world object.

```xml
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
  <rect x="3" y="5" width="18" height="14" rx="2"/>
  <polyline points="3 5 12 13 21 5"/>
</svg>
```

**Why it works**: Two elements — rectangle body and V-shaped flap line. The `rx="2"` on the rect matches the preset's corner radius. The envelope flap's peak (12, 13) is slightly above centre, which matches how real envelopes look. The rect spans the full usable width (3–21) because envelopes are wide.

---

## Medium Icon: Phone
A phone handset. Demonstrates curved paths and the curved stroke compensation principle.

```xml
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
  <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07 19.5 19.5 0 01-6-6 19.79 19.79 0 01-3.07-8.67A2 2 0 014.11 2h3a2 2 0 012 1.72c.13.81.36 1.6.68 2.35a2 2 0 01-.45 2.11L8.09 9.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45c.75.32 1.54.55 2.35.68a2 2 0 011.72 2.03z"/>
</svg>
```

**Why it works**: Single path for the complete handset shape. The curves create a recognisable phone silhouette. Because this icon is almost entirely curved, the path is sized slightly more generously within the grid — it extends close to the edges to compensate for the visual thinning effect of curves.

---

## Complex Icon: Shield Check
A shield with a checkmark inside. Shows layering meaning (protection + verification).

```xml
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
  <path d="M12 2l7.5 3.5v5c0 5.25-3.19 8.69-7.5 11.5-4.31-2.81-7.5-6.25-7.5-11.5v-5L12 2z"/>
  <polyline points="9 12 11 14 15 10"/>
</svg>
```

**Why it works**: Two elements — shield outline and checkmark. The shield is vertically asymmetric (taller below centre than above) which matches how real shields look. The checkmark is positioned slightly above the shield's visual centre. The shield's top point (12, 2) is at the padding boundary, and its bottom (implicit from the curve, ~22) fills the vertical space.

---

## Complex Icon: Star
A five-pointed star. Demonstrates precise geometric construction.

```xml
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
  <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26"/>
</svg>
```

**Why it works**: Single `<polygon>` element. The star is calculated from proper geometry (inner/outer radius ratios) so it looks regular. The top point (12, 2) is at the padding boundary. The star is wider than it is tall, which is correct for five-pointed stars. Points use max 2 decimal places.

---

## Icon with Fill: Location Pin
Some icons need a filled element alongside stroked elements. Use `fill="currentColor"` on the specific element, not globally.

```xml
<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
  <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7z"/>
  <circle cx="12" cy="9" r="2.5" fill="currentColor"/>
</svg>
```

**Why it works**: The pin body is stroked (outline). The inner dot uses `fill="currentColor"` to appear solid while still respecting the `currentColor` system. The pin extends from y=2 (top) to an implied y=22 (bottom of the teardrop), using the full vertical space because pins are naturally tall and narrow.

---

## What to Avoid

### Bad: Hardcoded colours
```xml
<!-- WRONG -->
<circle cx="12" cy="12" r="8" stroke="#333" fill="#eee"/>
```

### Bad: Excessive precision
```xml
<!-- WRONG -->
<line x1="5.333333" y1="7.142857" x2="18.666667" y2="16.857143"/>
<!-- RIGHT -->
<line x1="5.5" y1="7" x2="18.5" y2="17"/>
```

### Bad: Transform instead of coordinates
```xml
<!-- WRONG -->
<g transform="translate(2, 3) rotate(45)">
  <rect x="0" y="0" width="10" height="10"/>
</g>
<!-- RIGHT: Bake the transform into coordinates -->
<rect x="7" y="5" width="10" height="10"/>
```

### Bad: Inconsistent padding
```xml
<!-- WRONG: One icon uses full bleed, another has generous padding -->
<!-- Icon A: path starts at x=1 (too close to edge) -->
<!-- Icon B: path starts at x=4 (too much padding) -->
<!-- RIGHT: Both should start at x=2 (or wherever the preset padding specifies) -->
```









---
name: image-processing
description: "Process images for web development — resize, crop, trim whitespace, convert formats (PNG/WebP/JPG), optimise file size, generate thumbnails, create OG card images. Uses Pillow (Python) — no ImageMagick needed. Trigger with 'resize image', 'convert to webp', 'trim logo', 'optimise images', 'make thumbnail', 'create OG image', 'crop whitespace', 'process image', or 'image too large'."
compatibility: claude-code-only
---

# Image Processing
Use `img-process` (shipped in `bin/`) for common operations. For complex or custom workflows, generate a Pillow script adapted to the user's environment.

## Quick Reference — img-process CLI

```bash
img-process resize hero.png --width 1920
img-process convert logo.png --format webp
img-process trim logo-raw.jpg -o logo-clean.png --padding 10
img-process thumbnail photo.jpg --size 200
img-process optimise hero.jpg --quality 85 --max-width 1920
img-process og-card -o og.png --title "My App" --subtitle "Built for speed"
img-process batch ./images --action convert --format webp -o ./optimised
```

**Use `img-process` when**: the operation is standard (resize, convert, trim, thumbnail, optimise, OG card, batch). This is faster and avoids generating a script each time.
**Generate a custom script when**: the operation needs logic `img-process` doesn't cover (compositing multiple images, watermarks, complex text layouts, conditional processing).

## Prerequisites
Pillow is required for both `img-process` and custom scripts:

```bash
pip install Pillow
```

If Pillow is unavailable, use alternatives:

| Alternative | Platform | Install | Best for |
|-------------|----------|---------|----------|
| `sips` | macOS (built-in) | None | Resize, convert (no trim/OG) |
| `sharp` | Node.js | `npm install sharp` | Full feature set, high performance |
| `ffmpeg` | Cross-platform | `brew install ffmpeg` | Resize, convert |

## Output Format Guide

| Use case | Format | Why |
|----------|--------|-----|
| Photos, hero images | WebP | Best compression, wide browser support |
| Logos, icons (need transparency) | PNG | Lossless, supports alpha |
| Fallback for older browsers | JPG | Universal support |
| Thumbnails | WebP or JPG | Small file size priority |
| OG cards | PNG | Social platforms handle PNG best |

## Core Patterns

### Save with Format-Specific Quality

Different formats need different save parameters. Always handle RGBA-to-JPG compositing — JPG does not support transparency, so composite onto a white background first.

```python
from PIL import Image
import os

def save_image(img, output_path, quality=None):
    os.makedirs(os.path.dirname(output_path) or ".", exist_ok=True)
    kwargs = {}
    ext = output_path.lower().rsplit(".", 1)[-1]

    if ext == "webp":
        kwargs = {"quality": quality or 85, "method": 6}
    elif ext in ("jpg", "jpeg"):
        kwargs = {"quality": quality or 90, "optimize": True}
        # RGBA → RGB: composite onto white background
        if img.mode == "RGBA":
            bg = Image.new("RGB", img.size, (255, 255, 255))
            bg.paste(img, mask=img.split()[3])
            img = bg
    elif ext == "png":
        kwargs = {"optimize": True}

    img.save(output_path, **kwargs)
```

### Resize with Aspect Ratio
When only width or height is given, calculate the other from aspect ratio. Use `Image.LANCZOS` for high-quality downscaling.

```python
def resize_image(img, width=None, height=None):
    if width and height:
        return img.resize((width, height), Image.LANCZOS)
    elif width:
        ratio = width / img.width
        return img.resize((width, int(img.height * ratio)), Image.LANCZOS)
    elif height:
        ratio = height / img.height
        return img.resize((int(img.width * ratio), height), Image.LANCZOS)
    return img
```

### Trim Whitespace (Auto-Crop)
Remove surrounding whitespace from logos and icons. Convert to RGBA first, then use `getbbox()` to find content bounds.

```python
img = Image.open(input_path)
if img.mode != "RGBA":
    img = img.convert("RGBA")
bbox = img.getbbox()  # Bounding box of non-zero pixels
if bbox:
    img = img.crop(bbox)
```

### Thumbnail

Fit within max dimensions while maintaining aspect ratio:

```python
img.thumbnail((size, size), Image.LANCZOS)
```

### Optimise for Web
Resize + compress in one step. Convert to WebP for best compression. Typical settings: width 1920, quality 85.

### Cross-Platform Font Discovery
System font paths differ by OS. Try multiple paths, fall back to Pillow's default. On Linux, `fc-list` can discover fonts dynamically.

```python
from PIL import ImageFont

def get_font(size):
    font_paths = [
        # macOS
        "/System/Library/Fonts/Helvetica.ttc",
        "/System/Library/Fonts/SFNSText.ttf",
        # Linux
        "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
        "/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf",
        # Windows
        "C:/Windows/Fonts/arial.ttf",
    ]
    for path in font_paths:
        if os.path.exists(path):
            try:
                return ImageFont.truetype(path, size)
            except Exception:
                continue
    return ImageFont.load_default()
```

### OG Card Generation (1200x630)

Composite text on a background image or solid colour. Apply semi-transparent overlay for text readability. Centre text horizontally.

```python
from PIL import Image, ImageDraw, ImageFont

width, height = 1200, 630

# Background: image or solid colour
if background_path:
    img = Image.open(background_path).resize((width, height), Image.LANCZOS)
else:
    img = Image.new("RGB", (width, height), bg_color or "#1a1a2e")

# Semi-transparent overlay for text readability
overlay = Image.new("RGBA", (width, height), (0, 0, 0, 128))
img = img.convert("RGBA")
img = Image.alpha_composite(img, overlay)

draw = ImageDraw.Draw(img)
font_title = get_font(48)
font_sub = get_font(24)

# Centre title
if title:
    bbox = draw.textbbox((0, 0), title, font=font_title)
    tw = bbox[2] - bbox[0]
    draw.text(((width - tw) // 2, height // 2 - 60), title, fill="white", font=font_title)

img = img.convert("RGB")
```

## Common Workflows
### Logo Cleanup (client-supplied JPG with white background)

```bash
img-process trim logo-raw.jpg -o logo-trimmed.png --padding 10
img-process thumbnail logo-trimmed.png --size 512 -o favicon-512.png
```

### Prepare Hero Image for Production

```bash
img-process optimise hero.jpg --max-width 1920 --quality 85
# Outputs hero.webp — resized and compressed
```

### Batch Process

```bash
img-process batch ./raw-images --action convert --format webp --quality 85 -o ./optimised
img-process batch ./photos --action resize --width 800 -o ./thumbnails
```

### Pipeline with Gemini Image Gen
Generate images with the gemini-image-gen skill, then process them:

```bash
# After generating with Gemini (raw PNG output):
img-process optimise generated-image.png --max-width 1920 --quality 85
# Or batch process all generated images:
img-process batch ./generated --action optimise -o ./production
```










---
name: evals l
---



{
  "skill_name": "image",
  "evals": [
    {
      "id": 1,
      "prompt": "I need a hero image for a blog post about email deliverability. Make it visually striking.",
      "expected_output": "Should check for product-marketing.md first. Should recommend AI generation as the approach for a one-off blog hero. Should propose a visual metaphor concept that represents email deliverability (e.g., letters being sorted through a maze, signals breaking through a wall, an inbox glow). Should specify 1200x630 (works for both hero and OG image). Should recommend Flux or Gemini for photorealistic, or Ideogram if text in image is needed. Should provide a prompt following Subject + Setting + Style + Lighting + Composition + Technical pattern. Should mention WebP optimization (target <200KB, JPEG fallback). Should not suggest using AI for product UI screenshots.",
      "assertions": [
        "Checks for product-marketing.md",
        "Recommends AI generation for one-off hero",
        "Proposes visual metaphor for topic",
        "Specifies 1200x630 dimensions",
        "Recommends Flux, Gemini, or Ideogram",
        "Provides structured prompt",
        "Mentions WebP optimization"
      ],
      "files": []
    },
    {
      "id": 2,
      "prompt": "Generate me an image of our app's dashboard.",
      "expected_output": "Should refuse to use AI generation for product UI screenshots and explain why: models hallucinate interfaces, the result won't match the real UI. Should recommend the Product Mockups & Screenshots workflow: capture real screenshots of the product at 2x resolution, frame in device mockups (browser frame, laptop, phone), add callout arrows or feature labels for context, programmatically overlay annotations with Hyperframes or HTML/CSS. Should suggest tools: browser DevTools screenshot, Shottr, CleanShot X, or screencapture CLI. Should warn this is Common Mistake #1: using AI for product UI.",
      "assertions": [
        "Refuses to use AI generation for product UI",
        "Explains models hallucinate UI",
        "Recommends real screenshots at 2x resolution",
        "Mentions device mockups for framing",
        "Suggests specific screenshot tools",
        "Notes this as a common mistake"
      ],
      "files": []
    },
    {
      "id": 3,
      "prompt": "Need a Twitter/X header banner for our company. We just want to show our product and tagline.",
      "expected_output": "Should specify Twitter/X header dimensions: 1500x500 (3:1 aspect ratio). Should warn the banner is partially obscured by the avatar — center critical content and avoid important elements near the avatar overlap area. Should recommend keeping text minimal (seen at small sizes on mobile). Should suggest design tools (Canva or Figma) over AI generation since brand consistency matters. Should recommend Ideogram if heavy text rendering is needed since other AI models butcher text. Should suggest using brand colors + tagline + optional product shot. Should remind to test at actual display size by zooming out.",
      "assertions": [
        "Specifies 1500x500 dimensions",
        "Warns about avatar overlap area",
        "Recommends minimal text",
        "Suggests Canva or Figma over AI",
        "Mentions Ideogram for text-heavy designs",
        "Recommends testing at display size"
      ],
      "files": []
    },
    {
      "id": 4,
      "prompt": "I need 5 versions of the same hero image for Twitter, LinkedIn, Instagram feed, Instagram stories, and Facebook. What's the fastest way?",
      "expected_output": "Should recommend the Canva Magic Resize workflow over generating 5 separate images. Should list dimensions: Twitter/X 1200x675 (16:9), LinkedIn 1200x627 (1.91:1), Instagram feed 1080x1080 (1:1 — note 1080x1350 / 4:5 also strong), Instagram Stories 1080x1920 (9:16), Facebook 1200x630 (1.91:1). Should explain workflow: create the hero concept at highest resolution needed, use Canva Magic Resize for variants, manually crop if needed, add text overlays programmatically if required (Ideogram or post-processing), export at each platform's specs. Should note this is what Canva Magic Resize is specifically designed for.",
      "assertions": [
        "Recommends Canva Magic Resize",
        "Lists dimensions for all 5 platforms",
        "Notes Instagram 4:5 variant",
        "Suggests programmatic text overlays for variants",
        "Says start at highest resolution"
      ],
      "files": []
    },
    {
      "id": 5,
      "prompt": "What's the best image format for our website?",
      "expected_output": "Should recommend WebP as the default choice with JPEG/PNG fallback. Should explain the format guide: WebP for photos and graphics (lossy + lossless, ~96% browser support), AVIF for highest compression (~94% support, newer), JPEG as universal fallback (lossy only), PNG for transparency and screenshots (lossless, universal), SVG for logos and icons (vector, scales, universal). Should reference the optimization checklist: resize to display size, compress (target quality 75-85% for photos), lazy load below-the-fold, set explicit width/height attributes (prevents CLS), use a CDN with auto-optimization (Cloudflare, Vercel, Imgix, Cloudinary), add descriptive alt text. Should provide a quick cwebp or mogrify command. Should note skipping image optimization is the #1 page speed killer.",
      "assertions": [
        "Recommends WebP as default",
        "Mentions JPEG/PNG fallback strategy",
        "Lists optimization checklist items",
        "Mentions lazy loading",
        "Mentions explicit dimensions to prevent CLS",
        "Provides command line tool example"
      ],
      "files": []
    },
    {
      "id": 6,
      "prompt": "We're a SaaS that just launched. Need OG images for every blog post we ship — about 2 per week. Doing it manually is killing us.",
      "expected_output": "Should recommend Dynamic OG Images programmatic approach. Should explain options: Vercel OG (@vercel/og) generates images at the edge using JSX — best for programmatic SEO since you can dynamically pull post title, author, image into a template; Satori converts HTML/CSS to SVG (powers Vercel OG); Cloudinary for URL-based text overlay on template images. Should explain you build the template once with your branding then it generates unique OG images per page using post metadata. Should mention required meta tags: og:image (1200x630), og:image:width, og:image:height, twitter:card summary_large_image, twitter:image. Should note this is best for programmatic SEO.",
      "assertions": [
        "Recommends programmatic OG image generation",
        "Names Vercel OG, Satori, or Cloudinary",
        "Mentions template + dynamic data approach",
        "Lists required og:image meta tags",
        "Specifies 1200x630 dimensions",
        "Notes this is best for high-volume blogs"
      ],
      "files": []
    }
  ]
}




---
!/usr/bin/env python3
Generate images from text prompts using Gemini API.
---


Usage:
    python generate_image.py "prompt" output.png [--model MODEL] [--aspect RATIO] [--size SIZE]

Examples:
    python generate_image.py "A cat in space" cat.png
    python generate_image.py "A logo for Acme Corp" logo.png --model gemini-3-pro-image-preview --aspect 1:1
    python generate_image.py "Epic landscape" landscape.png --aspect 16:9 --size 2K

Environment:
    GEMINI_API_KEY - Required API key
"""

import argparse
import os
import sys

from google import genai
from google.genai import types


def generate_image(
    prompt: str,
    output_path: str,
    model: str = "gemini-2.5-flash-image",
    aspect_ratio: str | None = None,
    image_size: str | None = None,
) -> str | None:
    """Generate an image from a text prompt.
    
    Args:
        prompt: Text description of the image to generate
        output_path: Path to save the generated image
        model: Gemini model to use
        aspect_ratio: Aspect ratio (1:1, 16:9, 9:16, etc.)
        image_size: Resolution (1K, 2K, 4K - 4K only for pro model)
    
    Returns:
        Any text response from the model, or None
    """
    api_key = os.environ.get("GEMINI_API_KEY")
    if not api_key:
        raise EnvironmentError("GEMINI_API_KEY environment variable not set")
    
    client = genai.Client(api_key=api_key)
    
    # Build config
    config_kwargs = {"response_modalities": ["TEXT", "IMAGE"]}
    
    image_config_kwargs = {}
    if aspect_ratio:
        image_config_kwargs["aspect_ratio"] = aspect_ratio
    if image_size:
        image_config_kwargs["image_size"] = image_size
    
    if image_config_kwargs:
        config_kwargs["image_config"] = types.ImageConfig(**image_config_kwargs)
    
    config = types.GenerateContentConfig(**config_kwargs)
    
    response = client.models.generate_content(
        model=model,
        contents=[prompt],
        config=config,
    )
    
    text_response = None
    image_saved = False
    
    for part in response.parts:
        if part.text is not None:
            text_response = part.text
        elif part.inline_data is not None:
            image = part.as_image()
            image.save(output_path)
            image_saved = True
    
    if not image_saved:
        raise RuntimeError("No image was generated. Check your prompt and try again.")
    
    return text_response


def main():
    parser = argparse.ArgumentParser(
        description="Generate images from text prompts using Gemini API",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__
    )
    parser.add_argument("prompt", help="Text prompt describing the image")
    parser.add_argument("output", help="Output file path (e.g., output.png)")
    parser.add_argument(
        "--model", "-m",
        default="gemini-2.5-flash-image",
        choices=["gemini-2.5-flash-image", "gemini-3-pro-image-preview"],
        help="Model to use (default: gemini-2.5-flash-image)"
    )
    parser.add_argument(
        "--aspect", "-a",
        choices=["1:1", "2:3", "3:2", "3:4", "4:3", "4:5", "5:4", "9:16", "16:9", "21:9"],
        help="Aspect ratio"
    )
    parser.add_argument(
        "--size", "-s",
        choices=["1K", "2K", "4K"],
        help="Image resolution (4K only available with pro model)"
    )
    
    args = parser.parse_args()
    
    try:
        text = generate_image(
            prompt=args.prompt,
            output_path=args.output,
            model=args.model,
            aspect_ratio=args.aspect,
            image_size=args.size,
        )
        
        print(f"Image saved to: {args.output}")
        if text:
            print(f"Model response: {text}")
            
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()









---
!/usr/bin/env python3
Gemini Image Generation Library
A simple Python library for generating and editing images with the Gemini API.
---
"""


Usage:  from gemini_images import GeminiImageGenerator
    
    gen = GeminiImageGenerator()
    gen.generate("A sunset over mountains", "sunset.png")
    gen.edit("input.png", "Add clouds", "output.png")

Environment:
"""

import os
from pathlib import Path
from typing import Literal

from PIL import Image
from google import genai
from google.genai import types


AspectRatio = Literal["1:1", "2:3", "3:2", "3:4", "4:3", "4:5", "5:4", "9:16", "16:9", "21:9"]
ImageSize = Literal["1K", "2K", "4K"]
Model = Literal["gemini-2.5-flash-image", "gemini-3-pro-image-preview"]


class GeminiImageGenerator:
    """High-level interface for Gemini image generation."""
    
    FLASH = "gemini-2.5-flash-image"
    PRO = "gemini-3-pro-image-preview"
    
    def __init__(self, api_key: str | None = None, model: Model = FLASH):
        """Initialize the generator.
        
        Args:
            model: Default model to use
        """
        self.api_key = api_key or os.environ.get("GEMINI_API_KEY")
        if not self.api_key:
            raise EnvironmentError("GEMINI_API_KEY not set")
        
        self.client = genai.Client(api_key=self.api_key)
        self.model = model
    
    def _build_config(
        self,
        aspect_ratio: AspectRatio | None = None,
        image_size: ImageSize | None = None,
        google_search: bool = False,
    ) -> types.GenerateContentConfig:
        """Build generation config."""
        kwargs = {"response_modalities": ["TEXT", "IMAGE"]}
        
        img_config = {}
        if aspect_ratio:
            img_config["aspect_ratio"] = aspect_ratio
        if image_size:
            img_config["image_size"] = image_size
        
        if img_config:
            kwargs["image_config"] = types.ImageConfig(**img_config)
        
        if google_search:
            kwargs["tools"] = [{"google_search": {}}]
        
        return types.GenerateContentConfig(**kwargs)
    
    def generate(
        self,
        prompt: str,
        output: str | Path,
        *,
        model: Model | None = None,
        aspect_ratio: AspectRatio | None = None,
        image_size: ImageSize | None = None,
        google_search: bool = False,
    ) -> tuple[Path, str | None]:
        """Generate an image from a text prompt.
        
        Args:
            prompt: Text description
            output: Output file path
            model: Override default model
            aspect_ratio: Output aspect ratio
            image_size: Output resolution
            google_search: Enable Google Search grounding
        
        Returns:
            Tuple of (output path, optional text response)
        """
        output = Path(output)
        config = self._build_config(aspect_ratio, image_size, google_search)
        
        response = self.client.models.generate_content(
            model=model or self.model,
            contents=[prompt],
            config=config,
        )
        
        text = None
        for part in response.parts:
            if part.text:
                text = part.text
            elif part.inline_data:
                part.as_image().save(output)
        
        return output, text
    
    def edit(
        self,
        input_image: str | Path | Image.Image,
        instruction: str,
        output: str | Path,
        *,
        model: Model | None = None,
        aspect_ratio: AspectRatio | None = None,
        image_size: ImageSize | None = None,
    ) -> tuple[Path, str | None]:
        """Edit an existing image.
        
        Args:
            input_image: Input image (path or PIL Image)
            instruction: Edit instruction
            output: Output file path
            model: Override default model
            aspect_ratio: Output aspect ratio
            image_size: Output resolution
        
        Returns:
            Tuple of (output path, optional text response)
        """
        output = Path(output)
        
        if isinstance(input_image, (str, Path)):
            input_image = Image.open(input_image)
        
        config = self._build_config(aspect_ratio, image_size)
        
        response = self.client.models.generate_content(
            model=model or self.model,
            contents=[instruction, input_image],
            config=config,
        )
        
        text = None
        for part in response.parts:
            if part.text:
                text = part.text
            elif part.inline_data:
                part.as_image().save(output)
        
        return output, text
    
    def compose(
        self,
        instruction: str,
        images: list[str | Path | Image.Image],
        output: str | Path,
        *,
        model: Model | None = None,
        aspect_ratio: AspectRatio | None = None,
        image_size: ImageSize | None = None,
    ) -> tuple[Path, str | None]:
        """Compose multiple images into one.
        
        Args:
            instruction: Composition instruction
            images: List of input images (up to 14)
            output: Output file path
            model: Override default model 
            aspect_ratio: Output aspect ratio
            image_size: Output resolution
        
        Returns:
            Tuple of (output path, optional text response)
        """
        output = Path(output)
        
        # Load images
        loaded = []
        for img in images:
            if isinstance(img, (str, Path)):
                loaded.append(Image.open(img))
            else:
                loaded.append(img)
        
        config = self._build_config(aspect_ratio, image_size)
        contents = [instruction] + loaded
        
        response = self.client.models.generate_content(
            model=model or self.PRO,  # Pro recommended for composition
            contents=contents,
            config=config,
        )
        
        text = None
        for part in response.parts:
            if part.text:
                text = part.text
            elif part.inline_data:
                part.as_image().save(output)
        
        return output, text
    
    def chat(self) -> "ImageChat":
        """Start an interactive chat session for iterative refinement."""
        return ImageChat(self.client, self.model)


class ImageChat:
    """Multi-turn chat session for iterative image generation."""
    
    def __init__(self, client: genai.Client, model: Model):
        self.client = client
        self.model = model
        self._chat = client.chats.create(
            model=model,
            config=types.GenerateContentConfig(response_modalities=["TEXT", "IMAGE"]),
        )
        self.current_image: Image.Image | None = None
    
    def send(
        self,
        message: str,
        image: Image.Image | str | Path | None = None,
    ) -> tuple[Image.Image | None, str | None]:
        """Send a message and optionally an image.
        
        Returns:
            Tuple of (generated image or None, text response or None)
        """
        contents = [message]
        if image:
            if isinstance(image, (str, Path)):
                image = Image.open(image)
            contents.append(image)
        
        response = self._chat.send_message(contents)
        
        text = None
        img = None
        for part in response.parts:
            if part.text:
                text = part.text
            elif part.inline_data:
                img = part.as_image()
                self.current_image = img
        
        return img, text
    
    def reset(self):
        """Reset the chat session."""
        self._chat = self.client.chats.create(
            model=self.model,
            config=types.GenerateContentConfig(response_modalities=["TEXT", "IMAGE"]),
        )
        self.current_image = None



__
!/usr/bin/env python3
Edit existing images using Gemini API.
Usage: python edit_image.py input.png "edit instruction" output.png [options]
---

Examples:
    python edit_image.py photo.png "Add a rainbow in the sky" edited.png
    python edit_image.py room.jpg "Change the sofa to red leather" room_edited.jpg
    python edit_image.py portrait.png "Make it look like a Van Gogh painting" artistic.png --model gemini-3-pro-image-preview

Environment:
"""

import argparse
import os
import sys

from PIL import Image
from google import genai
from google.genai import types


def edit_image(
    input_path: str,
    instruction: str,
    output_path: str,
    model: str = "gemini-2.5-flash-image",
    aspect_ratio: str | None = None,
    image_size: str | None = None,
) -> str | None:

    """Edit an existing image based on text instructions.
    
    Args:
        input_path: Path to the input image
        instruction: Text description of edits to make
        output_path: Path to save the edited image
        model: Gemini model to use
        aspect_ratio: Output aspect ratio
        image_size: Output resolution
    
    Returns:
        Any text response from the model, or None
    """
    
    if not os.path.exists(input_path):
        raise FileNotFoundError(f"Input image not found: {input_path}")
    
    client = genai
    
    # Load input image
    input_image = Image.open(input_path)
    
    # Build config
    config_kwargs = {"response_modalities": ["TEXT", "IMAGE"]}
    
    image_config_kwargs = {}
    if aspect_ratio:
        image_config_kwargs["aspect_ratio"] = aspect_ratio
    if image_size:
        image_config_kwargs["image_size"] = image_size
    
    if image_config_kwargs:
        config_kwargs["image_config"] = types.ImageConfig(**image_config_kwargs)
    
    config = types.GenerateContentConfig(**config_kwargs)
    
    response = client.models.generate_content(
        model=model,
        contents=[instruction, input_image],
        config=config,
    )
    
    text_response = None
    image_saved = False
    
    for part in response.parts:
        if part.text is not None:
            text_response = part.text
        elif part.inline_data is not None:
            image = part.as_image()
            image.save(output_path)
            image_saved = True
    
    if not image_saved:
        raise RuntimeError("No image was generated. Check your instruction and try again.")
    
    return text_response


def main():
    parser = argparse.ArgumentParser(
        description="Edit images using Gemini API",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__
    )
    parser.add_argument("input", help="Input image path")
    parser.add_argument("instruction", help="Edit instruction")
    parser.add_argument("output", help="Output file path")
    parser.add_argument(
        "--model", "-m",
        default="gemini-2.5-flash-image",
        choices=["gemini-2.5-flash-image", "gemini-3-pro-image-preview"],
        help="Model to use (default: gemini-2.5-flash-image)"
    )
    parser.add_argument(
        "--aspect", "-a",
        choices=["1:1", "2:3", "3:2", "3:4", "4:3", "4:5", "5:4", "9:16", "16:9", "21:9"],
        help="Output aspect ratio"
    )
    parser.add_argument(
        "--size", "-s",
        choices=["1K", "2K", "4K"],
        help="Output resolution"
    )
    
    args = parser.parse_args()
    
    try:
        text = edit_image(
            input_path=args.input,
            instruction=args.instruction,
            output_path=args.output,
            model=args.model,
            aspect_ratio=args.aspect,
            image_size=args.size,
        )
        
        print(f"Edited image saved to: {args.output}")
        if text:
            print(f"Model response: {text}")
            
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()







__
!/usr/bin/env python3
Compose multiple images into a new image using Gemini API.
Usage:  python compose_images.py "instruction" output.png image1.png [image2.png ...]
---

Examples:
    python compose_images.py "Create a group photo of these people" group.png person1.png person2.png
    python compose_images.py "Put the cat from the first image on the couch from the second" result.png cat.png couch.png
    python compose_images.py "Apply the art style from the first image to the scene in the second" styled.png style.png photo.png


`edit_image.py`


```
#!/usr/bin/env python3
import argparse
from PIL import Image
from google import genai
from google.genai import types

def edit_image(input_path, instruction, output_path, model="gemini-2.5-flash-image"):
    client = genai.Client()
    input_image = Image.open(input_path)
    config = types.GenerateContentConfig(response_modalities=["TEXT", "IMAGE"])
    
    response = client.models.generate_content(
        model=model,
        contents=[instruction, input_image],
        config=config
    )
    for part in response.parts:
        if part.inline_data:
            part.as_image().save(output_path)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("input")
    parser.add_argument("instruction")
    parser.add_argument("output")
    args = parser.parse_args()
    edit_image(args.input, args.instruction, args.output)
```


`compose_images.py`

```Python

#!/usr/bin/env python3
import argparse
from PIL import Image
from google import genai
from google.genai import types

def compose_images(instruction, output_path, image_paths, model="gemini-3-pro-image-preview"):
    client = genai.Client()
    images = [Image.open(p) for p in image_paths]
    contents = [instruction] + images
    config = types.GenerateContentConfig(response_modalities=["TEXT", "IMAGE"])
    
    response = client.models.generate_content(model=model, contents=contents, config=config)
    for part in response.parts:
        if part.inline_data:
            part.as_image().save(output_path)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("instruction")
    parser.add_argument("output")
    parser.add_argument("images", nargs="+")
    args = parser.parse_args()
    compose_images(args.instruction, args.output, args.images)
    
```

#!/usr/bin/env python3
import sys
from PIL import Image
from google import genai
from google.genai import types

def