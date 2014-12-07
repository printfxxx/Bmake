#include <linux/init.h>
#include <linux/module.h>

static int __init kmod_init(void)
{
	pr_info("Hello world!\n");

	return 0;
}

static void __exit kmod_exit(void)
{
	pr_info("Goodbye world!\n");
}

module_init(kmod_init);
module_exit(kmod_exit);

MODULE_LICENSE("GPL");
