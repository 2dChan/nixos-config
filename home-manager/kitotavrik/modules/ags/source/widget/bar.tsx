import { App, Astal, Gtk, Gdk } from "astal/gtk3";
import { Variable, GLib, bind } from "astal";
import { timeout } from "astal/time";
import Wp from "gi://AstalWp";
import Bluetooth from "gi://AstalBluetooth";
import Battery from "./modules/battery";

// TODO: Refactor.
function BluetoothConection() {
	const bluetooth = Bluetooth.get_default();

	return bind(bluetooth, "is_connected").as((is) =>
		is ? <box className="Bluetooth" /> : <box />,
	);
}

function VolumeLevel() {
	const speaker = Wp.get_default()?.audio.defaultSpeaker!;

	return (
		<box className="Volume">
			<icon icon={bind(speaker, "volumeIcon")} />
		</box>
	);
}

function BatteryLevel() {
	const battery = Battery.get_default();

	return (
		<box className="Battery">
			<icon icon={bind(battery, "icon")} />
		</box>
	);
}

function Time({ format = " %I:%M %p" }) {
	const time = Variable<string>("").poll(
		10 ** 3,
		() => GLib.DateTime.new_now_local().format(format)!,
	);

	return (
		<box className="Time">
			<label onDestroy={() => time.drop()} label={time()} />
		</box>
	);
}

export default function Bar(monitor: Gdk.Monitor) {
	const { TOP, LEFT, RIGHT } = Astal.WindowAnchor;

	if (monitor.model == "Mi Monitor") return;

	return (
		<window
			className="Bar"
			gdkmonitor={monitor}
			exclusivity={Astal.Exclusivity.EXCLUSIVE}
			anchor={TOP | LEFT | RIGHT}
		>
			<box className="BarContainer">
				<box hexpand halign={Gtk.Align.END}>
					<VolumeLevel />
					<BluetoothConection />
					<box className="Split" />
					<BatteryLevel />
					<box className="Split" />
					<Time />
				</box>
			</box>
		</window>
	);
}
/*
<box hexpand halign={Gtk.Align.START}>
	<label label={"             "} />
</box>
*/
