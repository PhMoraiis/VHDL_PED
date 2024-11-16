import type { NextConfig } from "next";
import nextra from 'nextra'
 
const withNextra = nextra({
  theme: 'nextra-theme-docs',
  themeConfig: './theme.config.jsx'
})

const nextConfig: NextConfig = {
  output: "export",
  images: {
    unoptimized: true
  }
  /* config options here */
};

export default withNextra(nextConfig)