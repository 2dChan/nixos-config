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
		is ? <box className="bluetoothDot" /> : <box />,
	);
}

function VolumeLevel() {
	const speaker = Wp.get_default()?.audio.defaultSpeaker!;

	return (
		<eventbox className="VolumeLevel">
			<box>
				<icon icon={bind(speaker, "volumeIcon")} />
			</box>
		</eventbox>
	);
}

function BatteryLevel() {
	const bat = Battery.get_default();

	return (
		<overlay className="Battery">
			<circularprogress
				value={bind(bat, "persantage").as((p) => p / 100)}
				startAt={0.75}
				endAt={0.75}
			>
				<icon />
			</circularprogress>
		</overlay>
	);
}

function Time({ format = " %I:%M %p" }) {
	const time = Variable<string>("").poll(
		10 ** 3,
		() => GLib.DateTime.new_now_local().format(format)!,
	);

	return (
		<label className="Time" onDestroy={() => time.drop()} label={time()} />
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
			<box className="barContainer">
				<box hexpand halign={Gtk.Align.END}>
					<VolumeLevel />
					<BluetoothConection />
					<box className="vLine" />
					<BatteryLevel />
					<box className="vLine" />
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
