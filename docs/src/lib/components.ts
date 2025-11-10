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
import voltmeter from './images/components/36.svg';
import ammeter from './images/components/37.svg';
import ohmmeter from './images/components/38.svg';
import wattmeter from './images/components/39.svg';
import nobutton from './images/components/40.svg';
import noibutton from './images/components/41.svg';
import ncbutton from './images/components/42.svg';
import pcapacitor from './images/components/43.svg';
import circulator from './images/components/44.svg';
import land from './images/components/45.svg';
import lor from './images/components/46.svg';
import lxor from './images/components/47.svg';
import thermistor from './images/components/48.svg';
import presistor from './images/components/49.svg';
import sinductor from './images/components/50.svg';
import pinductor from './images/components/51.svg';
import iopamp from './images/components/52.svg';

export interface Component {
	name: string;
	full_name: string;
	image: string;
	quick?: boolean;
	release: string;
	options?: {
		full_name: string;
		release: string;
		image: string;
		name: string;
		alias?: string;
		default: string;
		description?: string;
		type?: string | string[];
	}[];
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
				full_name: 'variable resistor',
				release: '0.1.0',
				type: 'boolean',
				default: 'false',
				alias: 'rheostat',
				image: rheostat
			},
			{
				name: 'adjustable',
				full_name: 'adjustable resistor',
				release: '0.1.0',
				type: 'boolean',
				default: 'false',
				alias: 'potentiometer',
				image: potentiometer
			},
			{
				name: 'heatable',
				full_name: 'heating resistor',
				release: '0.4.0',
				type: 'boolean',
				default: 'false',
				alias: 'heater',
				image: heater
			},
			{
				name: 'sensor',
				full_name: 'sensing resistor',
				release: '0.5.0',
				alias: 'thermistor',
				type: 'boolean',
				default: 'false',
				image: thermistor
			},
			{
				name: 'preset',
				full_name: 'preset resistor',
				release: '0.5.0',
				type: 'boolean',
				default: 'false',
				image: presistor
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
		contributors: ['l0uisgrange'],
		options: [
			{
				name: 'dependent',
				full_name: 'dependent current source',
				release: '0.4.0',
				type: 'boolean',
				default: 'false',
				alias: 'disource',
				image: disource
			}
		]
	},
	{
		name: 'vsource',
		full_name: 'voltage source',
		image: vsource,
		quick: true,
		release: '0.1.0',
		contributors: ['l0uisgrange', 'LionelKarlen'],
		options: [
			{
				name: 'voltage',
				full_name: 'alternative voltage source',
				release: '0.3.0',
				type: ['"ac"', '"dc"'],
				default: '"ac"',
				alias: 'acvsource',
				image: acvsource
			},
			{
				name: 'dependent',
				full_name: 'dependent voltage source',
				release: '0.4.0',
				type: 'boolean',
				default: 'false',
				alias: 'dvsource',
				image: dvsource
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
				name: 'type',
				alias: 'led',
				type: ['"emitting"', '"receiving"', '"tunnel"', '"zener"', '"schottky"'],
				default: '',
				values: [
					{
						value: '"emitting"',
						full_name: 'light-emitting diode',
						alias: 'led',
						image: led,
						release: '0.2.0'
					},
					{
						value: '"receiving"',
						full_name: 'photodiode',
						alias: 'photodiode',
						image: photodiode,
						release: '0.2.0'
					},
					{
						value: '"tunnel"',
						full_name: 'tunnel diode',
						alias: 'tunnel',
						image: tunnel,
						release: '0.3.0'
					},
					{
						value: '"zener"',
						full_name: 'zener diode',
						alias: 'zener',
						image: zener,
						release: '0.3.0'
					},
					{
						value: '"schottky"',
						full_name: 'schottky diode',
						alias: 'schottky',
						image: schottky,
						release: '0.3.0'
					}
				]
			}
		]
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
				full_name: 'asymmetric fuse',
				release: '0.1.0',
				alias: 'afuse',
				type: 'boolean',
				default: 'false',
				image: afuse
			}
		]
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
				full_name: 'magnet motor',
				release: '0.1.0',
				image: mmotor,
				type: 'boolean',
				default: 'false'
			},
			{
				name: 'current',
				full_name: 'alternative current motor',
				release: '0.2.0',
				alias: 'acmotor',
				image: acmotor,
				type: ['"ac"', '"dc"'],
				default: '"dc"'
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
		name: 'bjt',
		full_name: 'bipolar junction transistor',
		image: npn,
		release: '0.1.0',
		contributors: ['l0uisgrange'],
		options: [
			{
				name: 'polarisation',
				type: ['"npn"', '"pnp"'],
				default: 'npn',
				release: '0.1.0',
				values: [
					{
						value: '"npn"',
						full_name: 'NPN transistor',
						alias: 'npn',
						image: npn,
						release: '0.1.0'
					},
					{
						value: '"pnp"',
						full_name: 'PNP transistor',
						alias: 'pnp',
						image: pnp,
						release: '0.1.0'
					}
				]
			}
		]
	},
	{
		name: 'land',
		full_name: 'digital logic AND',
		image: land,
		release: '0.5.0',
		contributors: ['l0uisgrange']
	},
	{
		name: 'lxor',
		full_name: 'digital logic XOR',
		image: lxor,
		release: '0.5.0',
		contributors: ['l0uisgrange']
	},
	{
		name: 'lor',
		full_name: 'digital logic OR',
		image: lor,
		release: '0.5.0',
		contributors: ['l0uisgrange']
	},
	{
		name: 'nmos',
		full_name: 'field-effect transistor',
		image: nmos,
		release: '0.2.0',
		contributors: ['l0uisgrange'],
		origin: 'pmos'
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
				full_name: 'inverter operational amplifier',
				type: 'boolean',
				default: 'false',
				release: '0.2.0',
				image: iopamp
			}
		]
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
		name: 'pcapacitor',
		full_name: 'polarized capacitor',
		image: pcapacitor,
		quick: true,
		release: '0.4.0',
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
		name: 'voltmeter',
		full_name: 'voltage meter',
		image: voltmeter,
		quick: true,
		release: '0.5.0',
		contributors: ['anarendiran'],
		options: [
			{
				name: 'measurand',
				type: 'content',
				default: 'V'
			}
		]
	},
	{
		name: 'ohmmeter',
		full_name: 'ohm meter',
		image: ohmmeter,
		quick: true,
		release: '0.5.0',
		contributors: ['anarendiran'],
		origin: 'voltmeter'
	},
	{
		name: 'ammeter',
		full_name: 'ampere meter',
		image: ammeter,
		quick: true,
		release: '0.5.0',
		contributors: ['anarendiran'],
		origin: 'voltmeter'
	},
	{
		name: 'wattmeter',
		full_name: 'watt meter',
		image: wattmeter,
		quick: true,
		release: '0.5.0',
		contributors: ['anarendiran'],
		origin: 'voltmeter'
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
	},
	{
		name: 'button',
		full_name: 'normally open push button',
		image: nobutton,
		quick: true,
		release: '0.5.0',
		contributors: ['l0uisgrange'],
		options: [
			{
				name: 'illuminated',
				type: 'boolean',
				default: 'false',
				description: 'Adds a lamp at the top of the symbol.'
			},
			{
				name: 'latching',
				type: 'boolean',
				default: 'false',
				description: 'Adds a latch symbol on the connection line.'
			},
			{
				name: 'head',
				type: ['"mushroom"', '"standard"'],
				default: '"standard"',
				description: 'Changes the button shape.'
			}
		]
	},
	{
		name: 'noibutton',
		full_name: 'normally open illuminated push button',
		image: noibutton,
		quick: true,
		release: '0.5.0',
		contributors: ['l0uisgrange'],
		origin: 'nobutton'
	},
	{
		name: 'ncbutton',
		full_name: 'normally closed illuminated push button',
		image: ncbutton,
		quick: true,
		release: '0.5.0',
		contributors: ['l0uisgrange'],
		origin: 'nobutton'
	},
	{
		name: 'circulator',
		full_name: 'circulator',
		image: circulator,
		quick: false,
		release: '0.5.0',
		contributors: ['l0uisgrange']
	}
];

type ContributorCount = {
	[key: string]: number;
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
