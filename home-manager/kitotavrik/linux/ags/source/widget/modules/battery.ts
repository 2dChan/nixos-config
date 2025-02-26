// Ref: https://aylur.github.io/astal/guide/typescript/binding#example-custom-connectable

import GObject, { register, property } from "astal/gobject";
import { monitorFile, readFileAsync } from "astal/file";
import { interval } from "astal/time";
import { exec, execAsync } from "astal/process";

const get = (args: string) =>
	Number(exec(`cat /sys/class/power_supply/${args}`));

@register({ GTypeName: "Battery" })
export default class Battery extends GObject.Object {
	static instance: Battery;

	static get_default() {
		if (!this.instance) this.instance = new Battery();

		return this.instance;
	}

	timeInterval = 10 ** 4;
	#capacity = get("macsmc-battery/capacity");
	#charging = get("macsmc-ac/online");

	@property(Number)
	get capacity() {
		return this.#capacity;
	}

	@property(Number)
	get charging() {
		return this.#charging;
	}

	@property(String)
	get icon() {
		const value = Math.round(this.capacity / 10) * 10;
		let status: string;

		status = `${value}`;
		if (this.charging) {
			status += "-charging";
		}
		return `battery-level-${status}-symbolic`;
	}

	constructor() {
		super();

		interval(this.timeInterval, async () => {
			const capacityPath = `/sys/class/power_supply/macsmc-battery/capacity`;
			const chargingPath = `/sys/class/power_supply/macsmc-ac/online`;

			const capacity = await readFileAsync(capacityPath);
			this.#capacity = Number(capacity);
			this.notify("capacity");
			const charging = await readFileAsync(chargingPath);
			this.#charging = Number(charging);
			this.notify("charging");
			this.notify("icon");
		});
	}
}
