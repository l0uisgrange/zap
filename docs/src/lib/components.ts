import resistor from './images/resistor.svg';
import inductor from './images/inductor.svg';
import isource from './images/isource.svg';
import vsource from './images/vsource.svg';
import fuse from './images/fuse.svg';
import diode from './images/diode.svg';
import led from './images/led.svg';
import dcmotor from './images/dcmotor.svg';
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

export interface Component {
	name: string;
	full_name: string;
	image: string;
	quick?: boolean;
	release?: string;
	options?: { name: string; alias?: string; default: string; description?: string; type?: string | string[] }[];
	origin?: string;
}

export const components: Component[] = [
	{
		name: 'resistor',
		full_name: 'resistor',
		image: resistor,
		quick: true,
		release: '0.1.0',
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
		name: 'inductor',
		full_name: 'inductor',
		image: inductor,
		quick: true,
		release: '0.1.0'
	},
	{
		name: 'isource',
		full_name: 'current source',
		image: isource,
		quick: true,
		release: '0.1.0'
	},
	{
		name: 'vsource',
		full_name: 'voltage source',
		image: vsource,
		quick: true,
		release: '0.1.0'
	},
	{
		name: 'fuse',
		full_name: 'fuse',
		image: fuse,
		quick: true,
		release: '0.1.0',
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
		release: '0.1.0'
	},
	{
		name: 'dcmotor',
		full_name: 'direct current motor',
		image: dcmotor,
		quick: true,
		release: '0.1.0',
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
		release: '0.1.0'
	},
	{
		name: 'earth',
		full_name: 'earth ground',
		image: earth,
		release: '0.1.0'
	},
	{
		name: 'bjt',
		full_name: 'bipolar junction transistor',
		image: bjt,
		release: '0.1.0',
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
		release: '0.2.0'
	},
	{
		name: 'frame',
		full_name: 'frame ground',
		image: frame,
		release: '0.2.0'
	},
	{
		name: 'capacitor',
		full_name: 'capacitor',
		image: capa,
		quick: true,
		release: '0.1.0'
	},
	{
		name: 'rheostat',
		full_name: 'rheostat resistor',
		image: rheostat,
		quick: true,
		release: '0.2.0',
		origin: 'resistor'
	},
	{
		name: 'potentiometer',
		full_name: 'potentiometer resistor',
		image: potentiometer,
		quick: true,
		release: '0.2.0',
		origin: 'resistor'
	}
];
