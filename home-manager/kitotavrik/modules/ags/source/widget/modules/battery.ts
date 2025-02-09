// Ref: https://aylur.github.io/astal/guide/typescript/binding#example-custom-connectable

import GObject, { register, property } from "astal/gobject";
import { monitorFile, readFileAsync } from "astal/file";
import { interval } from "astal/time";
import { exec, execAsync } from "astal/process";

const get = (args: string) =>
	Number(exec(`cat /sys/class/power_supply/macsmc-battery/${args}`));

@register({ GTypeName: "Battery" })
export default class Battery extends GObject.Object {
	static instance: Battery;

	static get_default() {
		if (!this.instance) this.instance = new Battery();

		return this.instance;
	}

	timeInterval = 10 ** 5;
	#persantage = get("capacity");

	@property(Number)
	get persantage() {
		return this.#persantage;
	}

	@property(String)
	get icon() {
		const value = this.persantage / 20 * 2;
		let status: string;

		if (value == 10){
			status = `${value}0`;
		}
		else {
			status = `0${value}0`
		}
		return `battery-${status}`;
	}

	constructor() {
		super();

		interval(this.timeInterval, async () => {
			const batteryPath = `/sys/class/power_supply/macsmc-battery/capacity`;

			const v = await readFileAsync(batteryPath);
			this.#persantage = Number(v);
			this.notify("persantage");
			this.notify("icon");
		});
	}
}
