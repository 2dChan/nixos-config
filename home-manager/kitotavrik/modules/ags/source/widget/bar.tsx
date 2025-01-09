import { App, Astal, Gtk, Gdk, } from "astal/gtk3"
import { Variable, GLib, bind, } from "astal"
import { timeout } from "astal/time"
import Wp from "gi://AstalWp"
import Battery from "./modules/battery"


function VolumeLevel() {
    const speaker = Wp.get_default()?.audio.defaultSpeaker!

    return <eventbox 
		// onHover={(self, event) => { self.revealer.revealChild = true }}
		className="VolumeLevel">
		<box>
			<icon icon={bind(speaker, "volumeIcon")} />
		</box>
	</eventbox>
}
//			<revealer
//			    setup={self => timeout(1000, () => self.revealChild = true)}
//			    transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}>
//				<box css="min-width: 100px">
//    				<slider
//    				    hexpand
//    				    onDragged={({ value }) => speaker.volume = value}
//    				    value={bind(speaker, "volume")}
//    				/>
//				</box>
//			</revealer>

function BatteryLevel() {
	const bat = Battery.get_default()

    return <overlay className="Battery">
		<circularprogress value={bind(bat, "persantage").as(p =>
			p / 100
		)} startAt={0.75} endAt={0.75}>
		    <icon />
		</circularprogress>
    </overlay>
}

// %a %h%e 
function Time({ format = " %I:%M %p" }) {
    const time = Variable<string>("").poll(10**3, () =>
        GLib.DateTime.new_now_local().format(format)!)

    return <label
        className="Time"
        onDestroy={() => time.drop()}
        label={time()}
    />
}

export default function Bar(monitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return <window
        className="Bar"
        gdkmonitor={monitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}>
        <centerbox>
            <box hexpand halign={Gtk.Align.END} >
				<VolumeLevel />
				<box className="vLine" />
				<BatteryLevel />
				<box className="vLine" />
				<Time />
            </box>
        </centerbox>
    </window>
}
