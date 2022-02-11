// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'BlueMind doc',
  tagline: 'Collaborative messaging',
  url: 'http://repository.blue-mind.loc/',
  baseUrl: '/docs/',
  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'BlueMind',
  projectName: 'BlueMind',

    i18n: {
	defaultLocale: 'fr',
	locales: ['fr', 'en']
    },
    
  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
	    routeBasePath: '/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
	blog: false
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: 'BlueMind Doc',
        logo: {
          alt: 'BlueMind Logo',
          src: 'img/logo.svg',
        },
        items: [
          {
            type: 'doc',
            docId: 'Documentation_BlueMind_4',
            position: 'left',
            label: 'Documentation BlueMind 4',
          },
	    {
		type: 'localeDropdown',
		position: 'left'
	    }
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Docs',
            items: [
              {
                label: 'Documentation Bluemind',
                to: '/',
              },
            ],
          },
          {
            title: 'Resources',
            items: [
              {
                label: 'Website',
                href: 'https://www.bluemind.net',
              },
              {
                label: 'AllBlueMind',
                href: 'https://all.bluemind.net',
              },
            ],
          },
          {
            title: 'More',
            items: [
              {
                label: 'Blog',
                href: 'https://blog.bluemind.net',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} BlueMind. Built with Docusaurus.`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
      },
    }),
};

module.exports = config;
