import resistor from './images/resistor.svg';
import inductor from './images/inductor.svg';
import isource from './images/isource.svg';
import vsource from './images/vsource.svg';
import fuse from './images/fuse.svg';
import diode from './images/diode.svg';
import led from './images/led.svg';
import dcmotor from './images/dcmotor.svg';
import vee from './images/vee.svg';
import vcc from './images/vcc.svg';
import ground from './images/ground.svg';
import earth from './images/earth.svg';
import bjt from './images/bjt.svg';
import mosfet from './images/mosfet.svg';
import opamp from './images/opamp.svg';
import acmotor from './images/acmotor.svg';
import frame from './images/frame.svg';
import capa from './images/capacitor.svg';
import rheostat from './images/rheostat.svg';
import potentiometer from './images/potentiometer.svg';
import heater from './images/heater.svg';
import zener from './images/zener.svg';
import schottky from './images/schottky.svg';
import tunnel from './images/tunnel.svg';
import acvsource from './images/acvsource.svg';

export interface Component {
	name: string;
	full_name: string;
	image: string;
	quick?: boolean;
	release: string;
	options?: { name: string; alias?: string; default: string; description?: string; type?: string | string[] }[];
	origin?: string;
	contributors?: string[]
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
		contributors: ['l0uisgrange'],
	},
	{
		name: 'isource',
		full_name: 'current source',
		image: isource,
		quick: true,
		release: '0.1.0',
		contributors: ['l0uisgrange'],
	},
	{
		name: 'acvsource',
		full_name: 'alternative voltage source',
		image: acvsource,
		quick: true,
		release: '0.3.0',
		contributors: ['l0uisgrange', 'LionelKarlen'],
	},
	{
		name: 'vsource',
		full_name: 'voltage source',
		image: vsource,
		quick: true,
		release: '0.1.0',
		contributors: ['l0uisgrange', 'LionelKarlen'],
	},
	{
		name: 'vcc',
		full_name: 'positive voltage supply',
		image: vcc,
		quick: false,
		release: '0.3.0',
		contributors: ['l0uisgrange', 'ThomasPDye'],
	},
	{
		name: 'vee',
		full_name: 'negative voltage supply',
		image: vee,
		quick: false,
		release: '0.3.0',
		contributors: ['ThomasPDye'],
	},
	{
		name: 'zener',
		full_name: 'zener diode',
		image: zener,
		quick: true,
		release: '0.3.0',
		origin: "diode",
		contributors: ['Pariatorn'],
	},
	{
		name: 'tunnel',
		full_name: 'tunnel diode',
		image: tunnel,
		quick: true,
		release: '0.3.0',
		origin: "diode",
		contributors: ['Pariatorn'],
	},
	{
		name: 'schottky',
		full_name: 'schottky diode',
		image: schottky,
		quick: true,
		release: '0.3.0',
		origin: "diode",
		contributors: ['Pariatorn'],
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
		contributors: ['l0uisgrange'],
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
		contributors: ['l0uisgrange'],
	},
	{
		name: 'earth',
		full_name: 'earth ground',
		image: earth,
		release: '0.1.0',
		contributors: ['l0uisgrange'],
	},
	{
		name: 'bjt',
		full_name: 'bipolar junction transistor',
		image: bjt,
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
		name: 'mosfet',
		full_name: 'field-effect transistor',
		image: mosfet,
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
		contributors: ['l0uisgrange'],
	},
	{
		name: 'frame',
		full_name: 'frame ground',
		image: frame,
		release: '0.2.0',
		contributors: ['l0uisgrange'],
	},
	{
		name: 'capacitor',
		full_name: 'capacitor',
		image: capa,
		quick: true,
		release: '0.1.0',
		contributors: ['l0uisgrange'],
	},
	{
		name: 'rheostat',
		full_name: 'rheostat resistor',
		image: rheostat,
		quick: true,
		release: '0.2.0',
		origin: 'resistor',
		contributors: ['l0uisgrange'],
	},
	{
		name: 'potentiometer',
		full_name: 'potentiometer resistor',
		image: potentiometer,
		quick: true,
		release: '0.2.0',
		origin: 'resistor',
		contributors: ['l0uisgrange'],
	}
];

type ContributorCount = {
	[key: string]: number;
};

const contributorCounts: ContributorCount = components.reduce((acc: ContributorCount, component) => {
	if (component.contributors) {
		component.contributors.forEach(contributor => {
			acc[contributor] = (acc[contributor] || 0) + 1;
		});
	}
	return acc;
}, {});

const sortedContributors = Object.entries(contributorCounts).sort(([, countA], [, countB]) => countB - countA);

const specialcontributors = [
	'thoams22', 'aortega0703', 'Geronymos', 'w-utter', 'TheRobot2105'
]
export const contributors = [...sortedContributors.map(([name]) => name), ...specialcontributors];
