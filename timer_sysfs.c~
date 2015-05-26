
#include <linux/kobject.h>
#include <linux/string.h>
#include <linux/sysfs.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/timer.h>

static struct kobject *timer_kobj;
static struct timer_list hello_timer;

int period = 0;

ssize_t timer_sysfs_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
{
	return sprintf(buf, "%d\n", period);
}

ssize_t timer_sysfs_store(struct kobject *kobj, struct kobj_attribute *attr, const char *buf, size_t count)
{
	sscanf(buf, "%d", &period);

	if (period == 0)
		del_timer(&hello_timer);
	else
		mod_timer(&hello_timer, jiffies + msecs_to_jiffies(period));

	return count;
}

static struct kobj_attribute timer_attribute = __ATTR(timer_period, 0666, timer_sysfs_show, timer_sysfs_store);

static struct attribute *attrs[] = {
	&timer_attribute.attr,
	NULL
};

static struct attribute_group timer_attr_group = {
	.attrs = attrs,
};


void timer_sysfs_callback(unsigned long data)
{
	printk("Hello, world! (jiffies = %ld)\n", jiffies);
	mod_timer(&hello_timer, jiffies + msecs_to_jiffies(period));
}




