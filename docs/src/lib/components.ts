import acmotor from './images/components/01.svg';
import acvsource from './images/components/02.svg';
import adc from './images/components/03.svg';
import capacitor from './images/components/04.svg';
import dac from './images/components/05.svg';
import dcmotor from './images/components/06.svg';
import diode from './images/components/07.svg';
import earth from './images/components/08.svg';
import frame from './images/components/09.svg';
import ground from './images/components/10.svg';
import fuse from './images/components/11.svg';
import heater from './images/components/12.svg';
import dvsource from './images/components/13.svg';
import disource from './images/components/14.svg';
import inductor from './images/components/15.svg';
import isource from './images/components/16.svg';
import led from './images/components/17.svg';
import potentiometer from './images/components/18.svg';
import resistor from './images/components/19.svg';
import rheostat from './images/components/20.svg';
import schottky from './images/components/21.svg';
import tunnel from './images/components/22.svg';
import vsource from './images/components/23.svg';
import zener from './images/components/24.svg';
import vcc from './images/components/25.svg';
import vee from './images/components/26.svg';
import afuse from './images/components/27.svg';
import transformer from './images/components/28.svg';
import mcu from './images/components/29.svg';
import opamp from './images/components/30.svg';
import npn from './images/components/31.svg';
import pmos from './images/components/32.svg';
import pnp from './images/components/33.svg';
import nmos from './images/components/34.svg';
import antenna from './images/components/35.svg';

export interface Component {
	name: string;
	full_name: string;
	image: string;
	quick?: boolean;
	release: string;
	options?: { name: string; alias?: string; default: string; description?: string; type?: string | string[] }[];
	origin?: string;
	contributors?: string[];
}

export const components: Component[] = [
	{
		name: 'resistor',
		full_name: 'resistor',
		image: resistor,
		quick: true,
		release: '0.1.0',
		contributors: ['l0uisgrange'],
		options: [
			{
				name: 'variable',
				alias: 'rheostat',
				type: 'boolean',
				default: 'false',
				description: 'Draws an arrow accross the resistor'
			},
			{
				name: 'adjustable',
				alias: 'potentiometer',
				type: 'boolean',
				default: 'false',
				description: 'Draws an arrow perpendicular to the resistor'
			}
		]
	},
	{
		name: 'heater',
		full_name: 'heating resistor',
		image: heater,
		quick: true,
		release: '0.3.0',
		origin: 'resistor',
		contributors: ['l0uisgrange'],
		options: [
			{
				name: 'variable',
				type: 'boolean',
				default: 'false',
				description: 'Draws an arrow accross the heater'
			},
			{
				name: 'adjustable',
				type: 'boolean',
				default: 'false',
				description: 'Draws an arrow perpendicular to the heater'
			}
		]
	},
	{
		name: 'inductor',
		full_name: 'inductor',
		image: inductor,
		quick: true,
		release: '0.1.0',
		contributors: ['l0uisgrange']
	},
	{
		name: 'isource',
		full_name: 'current source',
		image: isource,
		quick: true,
		release: '0.1.0',
		contributors: ['l0uisgrange']
	},
	{
		name: 'acvsource',
		full_name: 'alternative voltage source',
		image: acvsource,
		quick: true,
		release: '0.3.0',
		contributors: ['l0uisgrange', 'LionelKarlen']
	},
	{
		name: 'vsource',
		full_name: 'voltage source',
		image: vsource,
		quick: true,
		release: '0.1.0',
		contributors: ['l0uisgrange', 'LionelKarlen']
	},
	{
		name: 'dvsource',
		full_name: 'dependent voltage source',
		image: dvsource,
		quick: true,
		release: '0.4.0',
		contributors: ['l0uisgrange'],
		origin: 'vsource'
	},
	{
		name: 'disource',
		full_name: 'dependent current source',
		image: disource,
		quick: true,
		release: '0.4.0',
		contributors: ['l0uisgrange'],
		origin: 'isource'
	},
	{
		name: 'vcc',
		full_name: 'positive voltage supply',
		image: vcc,
		quick: false,
		release: '0.3.0',
		contributors: ['l0uisgrange', 'ThomasPDye']
	},
	{
		name: 'vee',
		full_name: 'negative voltage supply',
		image: vee,
		quick: false,
		release: '0.3.0',
		contributors: ['ThomasPDye']
	},
	{
		name: 'zener',
		full_name: 'zener diode',
		image: zener,
		quick: true,
		release: '0.3.0',
		origin: 'diode',
		contributors: ['Pariatorn']
	},
	{
		name: 'tunnel',
		full_name: 'tunnel diode',
		image: tunnel,
		quick: true,
		release: '0.3.0',
		origin: 'diode',
		contributors: ['Pariatorn']
	},
	{
		name: 'schottky',
		full_name: 'schottky diode',
		image: schottky,
		quick: true,
		release: '0.3.0',
		origin: 'diode',
		contributors: ['Pariatorn']
	},
	{
		name: 'afuse',
		full_name: 'asymmetric fuse',
		image: afuse,
		quick: true,
		release: '0.1.0',
		origin: 'fuse',
		contributors: ['l0uisgrange']
	},
	{
		name: 'transformer',
		full_name: 'transformer',
		image: transformer,
		quick: true,
		release: '0.4.0',
		contributors: ['l0uisgrange']
	},
	{
		name: 'antenna',
		full_name: 'antenna',
		image: antenna,
		quick: false,
		release: '0.4.0',
		contributors: ['l0uisgrange']
	},
	{
		name: 'fuse',
		full_name: 'fuse',
		image: fuse,
		quick: true,
		release: '0.1.0',
		contributors: ['l0uisgrange'],
		options: [
			{
				name: 'asymmetric',
				alias: 'afuse',
				type: 'boolean',
				default: 'false',
				description: 'Draws a black rectangle on one side'
			}
		]
	},
	{
		name: 'diode',
		full_name: 'diode',
		image: diode,
		quick: true,
		release: '0.1.0',
		contributors: ['l0uisgrange', 'Pariatorn'],
		options: [
			{
				name: 'emitting',
				alias: 'led',
				type: 'boolean',
				default: 'false',
				description: 'Draws arrows coming from the diode'
			},
			{
				name: 'receiving',
				alias: 'photodiode',
				type: 'boolean',
				default: 'false',
				description: 'Draws arrows coming to the diode'
			}
		]
	},
	{
		name: 'led',
		full_name: 'light-emitting diode',
		image: led,
		quick: true,
		release: '0.1.0',
		contributors: ['l0uisgrange']
	},
	{
		name: 'dcmotor',
		full_name: 'direct current motor',
		image: dcmotor,
		quick: true,
		release: '0.1.0',
		contributors: ['l0uisgrange'],
		options: [
			{
				name: 'magnet',
				type: 'boolean',
				default: 'false',
				description: 'Shows the magnets as black rectangles'
			}
		]
	},
	{
		name: 'ground',
		full_name: 'ground',
		image: ground,
		release: '0.1.0',
		contributors: ['l0uisgrange']
	},
	{
		name: 'earth',
		full_name: 'earth ground',
		image: earth,
		release: '0.1.0',
		contributors: ['l0uisgrange']
	},
	{
		name: 'npn',
		full_name: 'bipolar junction transistor',
		image: npn,
		release: '0.1.0',
		contributors: ['l0uisgrange'],
		options: [
			{
				name: 'envelope',
				type: 'boolean',
				default: 'false',
				description: 'Draws a circle around the transistor'
			}
		]
	},
	{
		name: 'pnp',
		full_name: 'bipolar junction transistor',
		image: pnp,
		release: '0.1.0',
		contributors: ['l0uisgrange'],
		origin: "npn"
	},
	{
		name: 'nmos',
		full_name: 'field-effect transistor',
		image: nmos,
		release: '0.2.0',
		contributors: ['l0uisgrange'],
		origin: "pmos"
	},
	{
		name: 'pmos',
		full_name: 'field-effect transistor',
		image: pmos,
		release: '0.2.0',
		contributors: ['l0uisgrange'],
		options: [
			{
				name: 'envelope',
				type: 'boolean',
				default: 'false',
				description: 'Draws a circle around the transistor'
			},
			{
				name: 'channel',
				alias: 'nmos',
				type: ['"n"', '"p"'],
				default: 'n',
				description: 'Draws a circle around the transistor'
			},
			{
				name: 'mode',
				alias: 'nmosd',
				type: ['"enhancement"', '"depletion"'],
				default: 'enhancement',
				description: 'Chooses between a dashed line and a continuous one'
			},
			{
				name: 'bulk',
				type: ['"internal"', '"external"', 'none'],
				default: 'internal',
				description: 'Changes the origin and anchors of the bulk'
			}
		]
	},
	{
		name: 'opamp',
		full_name: 'operational amplifier',
		image: opamp,
		release: '0.2.0',
		contributors: ['l0uisgrange'],
		options: [
			{
				name: 'invert',
				type: 'boolean',
				default: 'false'
			}
		]
	},
	{
		name: 'acmotor',
		full_name: 'alternative current motor',
		image: acmotor,
		quick: true,
		release: '0.2.0',
		contributors: ['l0uisgrange']
	},
	{
		name: 'frame',
		full_name: 'frame ground',
		image: frame,
		release: '0.2.0',
		contributors: ['l0uisgrange']
	},
	{
		name: 'capacitor',
		full_name: 'capacitor',
		image: capacitor,
		quick: true,
		release: '0.1.0',
		contributors: ['l0uisgrange']
	},
	{
		name: 'rheostat',
		full_name: 'rheostat resistor',
		image: rheostat,
		quick: true,
		release: '0.2.0',
		origin: 'resistor',
		contributors: ['l0uisgrange']
	},
	{
		name: 'potentiometer',
		full_name: 'potentiometer resistor',
		image: potentiometer,
		quick: true,
		release: '0.2.0',
		origin: 'resistor',
		contributors: ['l0uisgrange']
	},
	{
		name: 'adc',
		full_name: 'analog-digital converter',
		image: adc,
		quick: true,
		release: '0.4.0',
		origin: 'converter',
		contributors: ['l0uisgrange']
	},
	{
		name: 'dac',
		full_name: 'digital-analog converter',
		image: dac,
		quick: true,
		release: '0.4.0',
		origin: 'converter',
		contributors: ['l0uisgrange']
	},
	{
		name: 'mcu',
		full_name: 'microcontroller unit',
		image: mcu,
		quick: false,
		release: '0.4.0',
		origin: 'mcu',
		contributors: ['l0uisgrange'],
		options: [
			{
				name: 'pins',
				type: ['dictionary', 'number'],
				default: 'none',
				description:
					'Defines the output/input pins shown. If a number is specified, the pins will be spread between left and right. The pins have an anchor named "pinX" with X being the pin number.'
			}
		]
	}
];

type ContributorCount = {
	[key: string]: number;
};

const contributorCounts: ContributorCount = components.reduce((acc: ContributorCount, component) => {
	if (component.contributors) {
		component.contributors.forEach((contributor) => {
			acc[contributor] = (acc[contributor] || 0) + 1;
		});
	}
	return acc;
}, {});

const sortedContributors = Object.entries(contributorCounts).sort(([, countA], [, countB]) => countB - countA);

const specialcontributors = ['thoams22', 'aortega0703', 'Geronymos', 'w-utter', 'TheRobot2105'];
export const contributors = [...sortedContributors.map(([name]) => name), ...specialcontributors];
