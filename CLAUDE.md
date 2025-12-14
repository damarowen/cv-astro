# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build and Development Commands

```bash
npm run dev      # Start development server
npm run build    # Production build
npm run preview  # Preview production build
```

PM2 is configured (`pm2.config.cjs`) for running the dev server in background.

## Architecture Overview

This is an **Astro 2.6.1** static site generator project for a personal portfolio/CV site, using:
- **TailwindCSS** with **DaisyUI** component library (synthwave theme configured, lofi theme applied in BaseLayout)
- **MDX** for blog content with Shiki syntax highlighting (dracula theme)
- **Content Collections** for typed blog posts and store items

### Directory Structure

- `src/pages/` - File-based routing (index, cv, projects, services, blog/, store/)
- `src/layouts/` - BaseLayout (sidebar + content wrapper), PostLayout, StoreItemLayout
- `src/components/` - Reusable components including `cv/TimeLine.astro` for CV entries
- `src/content/` - Content collections with Zod schemas in `_schema.ts`
  - `blog/` - Markdown blog posts with title, description, pubDate, heroImage, badge
  - `store/` - Store items with pricing and checkout fields
- `src/config.ts` - Site title and description constants

### Key Patterns

**Content Collections**: Blog and store content defined with Zod schemas. Blog posts fetched and sorted by pubDate descending.

**Dynamic Routes**:
- `/blog/[slug].astro` - Individual posts
- `/blog/[...page].astro` - Paginated listing (10 per page)
- Same pattern for `/store/`

**Layouts**: All pages use BaseLayout which provides the drawer-based sidebar navigation. PostLayout removes sidebar on large screens.

**Components**: Card and HorizontalCard for content display, TimeLineElement for CV chronological entries, TawkTo for chat widget integration.

## Configuration Files

- `astro.config.mjs` - Integrations (MDX, sitemap, tailwind, image), markdown config
- `tailwind.config.cjs` - DaisyUI plugin, typography plugin, content paths
- `src/content/config.ts` - Content collection definitions
